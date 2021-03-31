#include <pluginlib/class_list_macros.h>
#include <math.h>

#include "safety_controller.h"
#include <kdl_conversions/kdl_msg.h>
//#include <control_toolbox/filters.h>
#include <semaphore.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/mman.h>


//    ****************** --------------------- Semaphores --------------------- ******************

//    A semaphore is an integer whose value is never allowed to fall below zero. Two operations can
//    be performed on semaphores: increment the semaphore value by one (sem_post(3)); and decrement
//    the semaphore value by one (sem_wait(3)).  If the value of a semaphore is currently zero, then
//    a sem_wait(3) operation will block until the value becomes greater than zero.

//    sem_open() creates a new POSIX semaphore or opens an existing semaphore. The semaphore is
//    identified by name.

//        sem_t *sem_open(const char *name, int oflag);
//        sem_t *sem_open(const char *name, int oflag, mode_t mode, unsigned int value);

//    The oflag argument specifies flags that control the operation of the call. If O_CREAT is
//    specified in oflag, then the semaphore is created if it does not already exist. The mode
//    argument specifies the permissions to be placed on the new semaphore, as for open(2). The
//    value argument specifies the initial value for the new semaphore.  If O_CREAT is specified,
//    and a semaphore with the given name already exists, then mode and value are ignored.


#define SNAME "/safety_stop"
//sem_t *sem_safety = sem_open(SNAME, O_CREAT | O_RDWR, 0777, 0);

namespace safety_controllers
{
  //sem_t *sem ;//= sem_open(SNAME, O_CREAT | O_EXCL, 0644, 1); /* Initial value is 3. */

  SafetyController::SafetyController(void)
  {
//#if RUN_GAZEBO
    // ---------------- Shared memory for Safety_in IO ----------------
    unsigned int size_safety_in = sizeof(int[41]);
    int fd_safety_in = shm_open("safety_in", O_CREAT | O_RDWR, 0666);
    ftruncate(fd_safety_in, size_safety_in);
    shm_safety_in = static_cast<int*>(mmap(nullptr, size_safety_in, PROT_READ | PROT_WRITE, MAP_SHARED, fd_safety_in, 0));

    // ---------------- Shared memory for Safety_out IO ----------------
    unsigned int size_safety_out = sizeof(int[41]);
    int fd_safety_out = shm_open("safety_out", O_CREAT | O_RDWR, 0666);
    ftruncate(fd_safety_out, size_safety_out);
    shm_safety_out = static_cast<int*>(mmap(nullptr, size_safety_out, PROT_READ | PROT_WRITE, MAP_SHARED, fd_safety_out, 0));

//    // ---------------- Shared memory for Force mode data ----------------
//    unsigned int size_force_mode_data = sizeof(double[26]);
//    int fd_force_mode_data  = shm_open("force_mode_data", O_CREAT | O_RDWR, 0666);
//    ftruncate(fd_force_mode_data, size_force_mode_data);
//    shm_force_mode_data = static_cast<double*>(mmap(nullptr, size_force_mode_data, PROT_READ | PROT_WRITE, MAP_SHARED, fd_force_mode_data, 0));

    // ---------------- Shared memory for enabling and disabling force mode ----------------
    unsigned int size_force_mode_enable = sizeof(bool);
    int fd_force_mode_enable  = shm_open("force_mode_enable", O_CREAT | O_RDWR, 0666);
    ftruncate(fd_force_mode_enable, size_force_mode_enable);
    shm_force_mode_enable = static_cast<bool*>(mmap(nullptr, size_force_mode_enable, PROT_READ | PROT_WRITE, MAP_SHARED, fd_force_mode_enable, 0));

    // ---------------- Shared memory for safety planes in Safety Controller ----------------
    unsigned int size_safety_plane_data = sizeof(double[65]);
    int fd_safety_plane_data  = shm_open("safety_plane_data", O_CREAT | O_RDWR, 0666);
    ftruncate(fd_safety_plane_data, size_safety_plane_data);
    shm_safety_plane_data = static_cast<double*>(mmap(nullptr, size_safety_plane_data, PROT_READ | PROT_WRITE, MAP_SHARED, fd_safety_plane_data, 0));

    // ---------------- Shared memory for Tool Position in Safety Controller ----------------
    unsigned int size_safety_tool_position = sizeof(double[13]);
    int fd_safety_tool_position  = shm_open("safety_tool_position", O_CREAT | O_RDWR, 0666);
    ftruncate(fd_safety_tool_position, size_safety_tool_position);
    shm_safety_tool_position = static_cast<double*>(mmap(nullptr, size_safety_tool_position, PROT_READ | PROT_WRITE, MAP_SHARED, fd_safety_tool_position, 0));

    // ---------------- Shared memory for Tool orientation in Safety Controller ----------------
    unsigned int size_safety_tool_direction = sizeof(double[7]);
    int fd_safety_tool_direction  = shm_open("safety_tool_direction", O_CREAT | O_RDWR, 0666);
    ftruncate(fd_safety_tool_direction, size_safety_tool_direction);
    shm_safety_tool_direction = static_cast<double*>(mmap(nullptr, size_safety_tool_direction, PROT_READ | PROT_WRITE, MAP_SHARED, fd_safety_tool_direction, 0));

    // ---------------- Shared memory for Joint limits in Safety Controller ----------------
    unsigned int size_safety_joint_limits = sizeof(double[42]);
    int fd_safety_joint_limits  = shm_open("safety_joint_limits", O_CREAT | O_RDWR, 0666);
    ftruncate(fd_safety_joint_limits, size_safety_joint_limits);
    shm_safety_joint_limits = static_cast<double*>(mmap(nullptr, size_safety_joint_limits, PROT_READ | PROT_WRITE, MAP_SHARED, fd_safety_joint_limits, 0));

    // ---------------- Shared memory for Robot limits in Safety Controller ----------------
    unsigned int size_safety_robot_limits = sizeof(double[16]);
    int fd_safety_robot_limits = shm_open("safety_robot_limits", O_CREAT | O_RDWR, 0666);
    ftruncate(fd_safety_robot_limits, size_safety_robot_limits);
    shm_safety_robot_limits = static_cast<double*>(mmap(nullptr, size_safety_robot_limits, PROT_READ | PROT_WRITE, MAP_SHARED, fd_safety_robot_limits, 0));

    // ---------------- Shared memory for Robot limits in Safety Controller ----------------
    unsigned int size_safety_error_list = sizeof(double[401]);
    int fd_safety_error_list = shm_open("safety_error_list", O_CREAT | O_RDWR, 0666);
    ftruncate(fd_safety_error_list, size_safety_error_list);
    shm_safety_error_list = static_cast<double*>(mmap(nullptr, size_safety_error_list, PROT_READ | PROT_WRITE, MAP_SHARED, fd_safety_error_list, 0));

    // ---------------- Shared memory for mode of operation (normal or reduced) ----------------
    unsigned int size_mode_of_opreration = sizeof(bool);
    int fd_mode_of_opreration = shm_open("mode_of_opreration", O_CREAT | O_RDWR, 0666);
    ftruncate(fd_mode_of_opreration, size_mode_of_opreration);
    shm_mode_of_operation = static_cast<bool*>(mmap(nullptr, size_mode_of_opreration, PROT_READ | PROT_WRITE, MAP_SHARED, fd_mode_of_opreration, 0));

    // ---------------- Shared memory for mode of operation (normal or reduced) ----------------
    unsigned int size_recovery_mode_flag = sizeof(bool);
    int fd_recovery_mode_flag = shm_open("recovery_mode_flag", O_CREAT | O_RDWR, 0666);
    ftruncate(fd_recovery_mode_flag, size_recovery_mode_flag);
    shm_recovery_mode_flag = static_cast<bool*>(mmap(nullptr, size_recovery_mode_flag, PROT_READ | PROT_WRITE, MAP_SHARED, fd_recovery_mode_flag, 0));





    unsigned int size_safety_joints_pos = sizeof(double[7]);
    int fd_safety_joints_pos = shm_open("safety_joints_position", O_CREAT | O_RDWR, 0666);
    ftruncate(fd_safety_joints_pos, size_safety_joints_pos);
    shm_joints_pos= static_cast<double*>(mmap(nullptr, size_safety_joints_pos, PROT_READ | PROT_WRITE, MAP_SHARED, fd_safety_joints_pos, 0));


     unsigned int size_safety_joints_vel = sizeof(double[7]);
    int fd_safety_joints_vel = shm_open("safety_joints_velocity", O_CREAT | O_RDWR, 0666);
    ftruncate(fd_safety_joints_vel, size_safety_joints_vel);
    shm_joints_vel= static_cast<double*>(mmap(nullptr, size_safety_joints_vel, PROT_READ | PROT_WRITE, MAP_SHARED, fd_safety_joints_vel, 0));


     unsigned int size_safety_joints_eff = sizeof(double[7]);
    int fd_safety_joints_eff = shm_open("safety_joints_effort", O_CREAT | O_RDWR, 0666);
    ftruncate(fd_safety_joints_eff, size_safety_joints_eff);
    shm_joints_eff= static_cast<double*>(mmap(nullptr, size_safety_joints_eff, PROT_READ | PROT_WRITE, MAP_SHARED, fd_safety_joints_eff, 0));
      

      sem_safety = sem_open( "/safety_robot_limit", O_CREAT | O_RDWR, 0777, 0);
      sem_safety1 = sem_open( "/safety_joint_limits", O_CREAT | O_RDWR, 0777, 0);
      sem_safety2 = sem_open( "/safety_plane", O_CREAT | O_RDWR, 0777, 0);
      sem_safety3 = sem_open( "/tool", O_CREAT | O_RDWR, 0777, 0);
      sem_joints_state=sem_open( "/joints_state", O_CREAT | O_RDWR, 0777, 0);
      sem_error_list=sem_open( "/error_list", O_CREAT | O_RDWR, 0777, 0);
       //sem_vel=sem_open( "/joints_velocity", O_CREAT | O_RDWR, 0777, 0);
     safety_in_access = sem_open("/safety_in_access", O_CREAT | O_RDWR, 0777, 1);
     safety_out_access = sem_open("/safety_out_access", O_CREAT | O_RDWR, 0777, 1);
//    *real_virtual_flag = false;
    *shm_mode_of_operation = true;
    *shm_recovery_mode_flag = false;
    shm_safety_error_list[0] = 0;
   shm_safety_in[0]=0;
    // ------------- Test values to evaluate safety performance ----------------

    // Data related to plane
   // shm_safety_plane_data[0] = 1;     // num planes

//    shm_safety_plane_data[1] = 0;   // plane org x
//    shm_safety_plane_data[2] = 0;     // plane org y
//    shm_safety_plane_data[3] = 0.4;   // plane org z
//    shm_safety_plane_data[4] = 0.0;   // plane norm x
//    shm_safety_plane_data[5] = 0.0;   // plane norm y
//    shm_safety_plane_data[6] = -1.0;   // plane norm z
//    shm_safety_plane_data[7] = 4.0;   // plane safety feat
//    shm_safety_plane_data[8] = 0.0;   // plane elbow restrict

//    shm_safety_plane_data[9] = 0.0;   // plane org x
//    shm_safety_plane_data[10] = 0.0;     // plane org y
//    shm_safety_plane_data[11] = 0.0;   // plane org z
//    shm_safety_plane_data[12] = 0.0;  // plane norm x
//    shm_safety_plane_data[13] = 0.0;   // plane norm y
//    shm_safety_plane_data[14] = 1.0;   // plane norm z
//    shm_safety_plane_data[15] = 4.0;   // plane safety feat
//    shm_safety_plane_data[16] = 0.0;   // plane elbow restrict

//    shm_safety_plane_data[17] = 0.0;   // plane org x
//    shm_safety_plane_data[18] = 0.0;     // plane org y
//    shm_safety_plane_data[19] = 0.8;   // plane org z
//    shm_safety_plane_data[20] = 0.0;  // plane norm x
//    shm_safety_plane_data[21] = 0.0;   // plane norm y
//    shm_safety_plane_data[22] = -1.0;   // plane norm z
//    shm_safety_plane_data[23] = 4.0;   // plane safety feat
//    shm_safety_plane_data[24] = 0.0;   // plane elbow restrict

//    shm_safety_plane_data[25] = 0.0;   // plane org x
//    shm_safety_plane_data[26] = 0.0;     // plane org y
//    shm_safety_plane_data[27] = 0.4;   // plane org z
//    shm_safety_plane_data[28] = 0.0;  // plane norm x
//    shm_safety_plane_data[29] = 0.0;   // plane norm y
//    shm_safety_plane_data[30] = -1.0;   // plane norm z
//    shm_safety_plane_data[31] = 2.0;   // plane safety feat
//    shm_safety_plane_data[32] = 0.0;   // plane elbow restrict

//    shm_safety_plane_data[33] = 0.0;   // plane org x
//    shm_safety_plane_data[34] = 0.3;     // plane org y
//    shm_safety_plane_data[35] = 0.0;   // plane org z
//    shm_safety_plane_data[36] = 0.0;  // plane norm x
//    shm_safety_plane_data[37] = 1.0;   // plane norm y
//    shm_safety_plane_data[38] = 0.0;   // plane norm z
//    shm_safety_plane_data[39] = 3.0;   // plane safety feat
//    shm_safety_plane_data[40] = 0.0;   // plane elbow restrict


    // Data related to tool position
   try_tool= sem_trywait( sem_safety3);
   if(try_tool == 0)
   { 
    shm_safety_tool_position[0] = 2;      // num tools

    shm_safety_tool_position[1] = 0.0;    // tool pos x
    shm_safety_tool_position[2] = 0.0;    // tool pos y
    shm_safety_tool_position[3] = 0.1;    // tool pos z
    shm_safety_tool_position[4] = 0.1;    // tool radius

    shm_safety_tool_position[5] = 0.0;    // tool pos x
    shm_safety_tool_position[6] = -0.1;    // tool pos y
    shm_safety_tool_position[7] = 0.0;    // tool pos z
    shm_safety_tool_position[8] = 0.1;    // tool radius
 
    
    // Data related to tool direction
  
    shm_safety_tool_direction[0] = 0.0;     // cone orient - x
    shm_safety_tool_direction[1] = 1.0;     // cone orient - y
    shm_safety_tool_direction[2] = 0.0;    // cone orient - z
    shm_safety_tool_direction[3] = 3.0;       // tool direction
    shm_safety_tool_direction[4] = M_PI/2;    // solid angle
    shm_safety_tool_direction[5] = M_PI/2;       // pan angle
    shm_safety_tool_direction[6] = M_PI/4;       // tilt angle
   }
    sem_post(sem_safety3);
 
 

   // Data for safety joint limits
  try_safety_joint_limit= sem_trywait( sem_safety1);
  if(try_safety_joint_limit == 0)
  {  

    for (int jnt_cnt = 0; jnt_cnt<7; jnt_cnt++)
    {
      if ((jnt_cnt+1)%2 == 0)  //for joint 2 4 6
      {
        shm_safety_joint_limits[6*jnt_cnt+0] = 2*M_PI/3;  // jnt max pos normal
        shm_safety_joint_limits[6*jnt_cnt+1] = -2*M_PI/3; //jnt min pos normal
        shm_safety_joint_limits[6*jnt_cnt+2] = 1.1*M_PI/2; // jnt max pos reduced
        shm_safety_joint_limits[6*jnt_cnt+3] = -1.1*M_PI/2; // jnt min pos reduced
        shm_safety_joint_limits[6*jnt_cnt+4] = M_PI; // velocity limit normal
        shm_safety_joint_limits[6*jnt_cnt+5] = 2*M_PI/3; // velocity limit reduced
      }
      else {
        shm_safety_joint_limits[6*jnt_cnt+0] = M_PI;
        shm_safety_joint_limits[6*jnt_cnt+1] = -M_PI;
        shm_safety_joint_limits[6*jnt_cnt+2] = 2*M_PI/3;
        shm_safety_joint_limits[6*jnt_cnt+3] = -2*M_PI/3;
        shm_safety_joint_limits[6*jnt_cnt+4] = M_PI;
        shm_safety_joint_limits[6*jnt_cnt+5] = 2*M_PI/3;
      }
    }
   }
   sem_post(sem_safety1);
 
    // Data related to Robot limits
    
   try_safety_robot_limit= sem_trywait( sem_safety);
   if(try_safety_robot_limit==0)
   {
    shm_safety_robot_limits[0] = 1.0; // momentum normal
    shm_safety_robot_limits[1] = 5.0; // momentum reduced
    shm_safety_robot_limits[2] = 3.0; // vel normal
    shm_safety_robot_limits[3] = 1.0; // vel reduced
     shm_safety_robot_limits[4] = 100; // force normal
    shm_safety_robot_limits[5] = 60;  // force reduced
    shm_safety_robot_limits[4] = 400; // power norrmal
    shm_safety_robot_limits[5] = 300; // power reduced
    }
 sem_post(sem_safety);
//#endif
  }

  SafetyController::~SafetyController()
  {
  }

  void SafetyController::pseudo_inverse(const Eigen::MatrixXd &jac_, Eigen::MatrixXd &jac_pinv_)
  {
    Eigen::JacobiSVD<Eigen::MatrixXd> singular_value_decomposition(jac_, Eigen::ComputeFullU | Eigen::ComputeFullV);
    Eigen::JacobiSVD<Eigen::MatrixXd>::SingularValuesType singular_values = singular_value_decomposition.singularValues();
    Eigen::MatrixXd S_ = jac_;
    S_.setZero();

    for(unsigned int cnt = 0; cnt < singular_values.size(); cnt++)
    {
      double damp_term = 0.0;
      if (fabs(singular_values(cnt)) < 0.12)
      {
//        std::cout<<" singular_values less than 0.12 "<<cnt<<" : - "<<singular_values(cnt)<<std::endl;
        compute_resultant_force = false;
        damp_term = 0.12;
      }
      S_(cnt,cnt) = (singular_values(cnt)/(singular_values(cnt)*singular_values(cnt)) + damp_term*(singular_values(cnt)/fabs(singular_values(cnt))));
    }

    jac_pinv_ = singular_value_decomposition.matrixV()*S_.transpose()*singular_value_decomposition.matrixU().transpose();
  }

  void SafetyController::transformKDLtoEigen(const KDL::FrameVel &k, Eigen::Matrix3d &e)
  {
    e.setIdentity();
    for (unsigned int i = 0; i < 9; ++i)
      e(i/3, i%3) = k.M.R.data[i];
  }

  // ------------- Initializing Safety controller ----------------
  bool SafetyController::init( ros::NodeHandle &n)
  {

    node_ = n;
   //  KdlUrdfParser kdlobj;  

  bool parse=  KdlUrdfParser::parser();
  if(parse)
    printf("parse success\n");
  else 
    printf("parse fail\n");

    kdl_tree_.getChain(first_link,tcp_link,tcp_default_chain_);
   kdl_tree_.getChain(first_link,tcp_link,tool_flange_chain_);

//    KinematicsBase<hardware_interface::JointStateInterface>::init(robot,n);
    num_joints = tcp_default_chain_.getNrOfJoints();

    joint_effort_solver_tool_flange_chain = new KDL::ChainIdSolver_RNE(tool_flange_chain_,gravity_);
    joint_effort_solver_tcp_default_chain = new KDL::ChainIdSolver_RNE(tcp_default_chain_,gravity_);
    jacobian_.reset(new KDL::ChainJntToJacSolver(tool_flange_chain_));

    jac_tmp.resize(num_joints);

    fk_solver_vel = new KDL::ChainFkSolverVel_recursive(tcp_default_chain_);
    cart_pos_links.resize(tcp_default_chain_.getNrOfSegments());

    XmlRpc::XmlRpcValue joint_names;
    if(!node_.getParam("/svaya/hardware_interface/joints",joint_names))
    {
      ROS_ERROR("No 'joints' in controller. (namespace: %s)",node_.getNamespace().c_str());
      return false;
    }

    if(joint_names.getType() != XmlRpc::XmlRpcValue::TypeArray)
    {
      ROS_ERROR("'joints' is not a struct. (namespace: %s)", node_.getNamespace().c_str());
      return false;
    }

    for(int i =0; i < joint_names.size();i++)
    {
      XmlRpc::XmlRpcValue &name_value= joint_names[i];
      if (name_value.getType() != XmlRpc::XmlRpcValue::TypeString)
      {
        ROS_ERROR("joint are not string. (namespace: %s)", node_.getNamespace().c_str());
        return false;
      }
      /*hardware_interface::JointStateHandle j=robot->getHandle(static_cast<std::string>(name_value));
      std::cout << static_cast<std::string>(name_value) << std::endl;
      joints_.push_back(j);*/
    }

    q.resize(num_joints);
    dq.resize(num_joints);
    ddq.resize(num_joints);

    qr.resize(num_joints);
    dqr.resize(num_joints);
    ddqr.resize(num_joints);

    actual_joint_effort.resize(num_joints);
    desired_joint_effort.resize(num_joints);

    // For testing purpose only
    data_pub = nh_.advertise<std_msgs::Float64MultiArray>("data_joint", 1000);
//    data_val.data.resize(kdl_chain_.getNrOfJoints());
    data_val.data.resize(1);
    //starting();
     windows = 0;
     windows_counter = 0;
     end_effector_vel = 0.0;

     transistion_ctr = 0;
     safety_flag = true;
     safety_limits_flag = false;
     // printf("Inside Starting\n");

     *shm_recovery_mode_flag = false;

   // printf("Inside Starting\n");
     safety_error_list.resize(80);
     safety_error_list[0].resize(1);
     for(unsigned int list_cnt = 1; list_cnt < 80; list_cnt++)
     {
       // printf("Inside For 1\n");
       safety_error_list[list_cnt].resize(5,0.0);
     }

//     ft_curr_val.setZero(6,1);
//     ft_sensor_present = false;

     normal_mode = true;
     reduced_mode_plane = false;
     reduced_mode_safety = false;
     reduced_mode = false;
     first_time = true;
     first_cycle = true;
     normal_mode_switch = false;
     red_mode_switch = false;

     compute_resultant_force = true;
   // printf("Before error\n");

    return true;
  }

/* void loadURDF(ros::NodeHandle nh, std::string param_name)
  {
    std::string urdf_string;
    urdf_model_ = new urdf::Model();

    while(urdf_string.empty() && ros::ok())
    {
      std::string search_param_name;
      if(nh.searchParam(param_name,search_param_name))
      {
        ROS_INFO_STREAM_NAMED(name_,"Waiting for model URDF on the ROS param server at location: " << nh.getNamespace() << search_param_name);
        nh.getParam(search_param_name,urdf_string);
      }
      else
      {
        ROS_INFO_STREAM_NAMED(name_,"Waiting for model URDF on the ROS param server at location: " << nh.getNamespace() << param_name);
        nh.getParam(param_name,urdf_string);
      }
      usleep(100000);
    }

    if (!urdf_model_->initString(urdf_string))
        ROS_INFO_STREAM_NAMED(name_, "Unable to load URDF model");
      else
        ROS_INFO_STREAM_NAMED(name_, "Received URDF from param server");
  }

}

*/
  // ------------- Safety controller starting ----------------
  void SafetyController::starting()
  {
   // printf("Inside Starting\n"); 
 /*   windows = 0;
     windows_counter = 0;
     end_effector_vel = 0.0;

     transistion_ctr = 0;
     safety_flag = true;
     safety_limits_flag = false;
     // printf("Inside Starting\n");

     *shm_recovery_mode_flag = false;

   // printf("Inside Starting\n");
     safety_error_list.resize(80);
     safety_error_list[0].resize(1);
     for(unsigned int list_cnt = 1; list_cnt < 80; list_cnt++)
     {
       // printf("Inside For 1\n");
       safety_error_list[list_cnt].resize(5,0.0);
     }

//     ft_curr_val.setZero(6,1);
//     ft_sensor_present = false;

     normal_mode = true;
     reduced_mode_plane = false;
     reduced_mode_safety = false;
     reduced_mode = false;
     first_time = true;
     first_cycle = true;
     normal_mode_switch = false;
     red_mode_switch = false;

     compute_resultant_force = true;
   // printf("Before error\n");
     error_cnt_safety_io.resize(shm_safety_in[0], 0);
   */
   printf(" --------------- Importing Data for Robot limits ---------------\n");
  try_safety_robot_limit= sem_trywait( sem_safety);
   if(try_safety_robot_limit==0)
    {
     printf("Robot limits data\n");
     tcp_mom_limit_normal_mode = shm_safety_robot_limits[0];
     tcp_mom_limit_reduced_mode = shm_safety_robot_limits[1];
     tcp_vel_limit_normal_mode = shm_safety_robot_limits[2];
     tcp_vel_limit_reduced_mode = shm_safety_robot_limits[3];
     tcp_force_limit_normal_mode = shm_safety_robot_limits[4];
     tcp_force_limit_reduced_mode = shm_safety_robot_limits[5];
     robot_power_limit_normal_mode = shm_safety_robot_limits[6];
     robot_power_limit_reduced_mode = shm_safety_robot_limits[7];
     }
     sem_post(sem_safety);
    printf(" --------------- Importing Data for Joint limits ---------------\n");
      
    
     joint_max_pos_limit_normal_mode.resize(num_joints);
     //printf("Jointpos\n");
     joint_min_pos_limit_normal_mode.resize(num_joints);
     joint_max_pos_limit_reduced_mode.resize(num_joints);
     joint_min_pos_limit_reduced_mode.resize(num_joints);
     joint_vel_limit_reduced_mode.resize(num_joints);
     joint_vel_limit_normal_mode.resize(num_joints);
  

  try_safety_joint_limit= sem_trywait( sem_safety1);
   if(try_safety_joint_limit == 0)
   {

     for(unsigned int jnt_cnt = 0; jnt_cnt < num_joints; jnt_cnt++)
     {
       printf("In For2\n");
       joint_max_pos_limit_normal_mode[jnt_cnt] = shm_safety_joint_limits[6*jnt_cnt];
       joint_min_pos_limit_normal_mode[jnt_cnt] = shm_safety_joint_limits[6*jnt_cnt+1];
       joint_max_pos_limit_reduced_mode[jnt_cnt] = shm_safety_joint_limits[6*jnt_cnt+2];
       joint_min_pos_limit_reduced_mode[jnt_cnt] = shm_safety_joint_limits[6*jnt_cnt+3];
       joint_vel_limit_normal_mode[jnt_cnt] = shm_safety_joint_limits[6*jnt_cnt+4];
       joint_vel_limit_reduced_mode[jnt_cnt] = shm_safety_joint_limits[6*jnt_cnt+5];

     }
   }
   sem_post(sem_safety1);

    printf("--------------- Importing Data for Safety Planes ---------------\n");

     num_planes = shm_safety_plane_data[0];
     plane_normal_dir.resize(num_planes); // resizing
     plane_elbow_restrict.resize(num_planes);
     plane_safety_feat.resize(num_planes);
     plane_origin.resize(num_planes);

    try_safety_plane= sem_trywait( sem_safety2);
    if(try_safety_plane == 0)
    {

     for (unsigned int plane_cnt = 0; plane_cnt < num_planes; plane_cnt++)
     {
       printf("Plane Data\n");
       Eigen::Vector3d loc_plane_org(shm_safety_plane_data[8*plane_cnt+1],shm_safety_plane_data[8*plane_cnt+2],shm_safety_plane_data[8*plane_cnt+3]);
       Eigen::Vector3d loc_plane_norm(shm_safety_plane_data[8*plane_cnt+4],shm_safety_plane_data[8*plane_cnt+5],shm_safety_plane_data[8*plane_cnt+6]);

       plane_origin[plane_cnt] = loc_plane_org;
       plane_normal_dir[plane_cnt] = loc_plane_norm;
       plane_safety_feat[plane_cnt] = shm_safety_plane_data[8*plane_cnt+7];
       plane_elbow_restrict[plane_cnt] = shm_safety_plane_data[8*plane_cnt+8];
     }
    }
   sem_post(sem_safety2);

     printf(" --------------- Importing Data for Tool Position ---------------\n");
   try_tool= sem_trywait( sem_safety3);
   if(try_tool == 0)
   { 
     num_tools = shm_safety_tool_position[0];
     tool_position.resize(num_tools);
     tool_radius.resize(num_tools);

     for (unsigned int tool_cnt = 0; tool_cnt < num_tools; tool_cnt++)
     {
       printf("Tool Data\n");
       Eigen::Vector3d loc_tool_pos(shm_safety_tool_position[4*tool_cnt+1],shm_safety_tool_position[4*tool_cnt+2],shm_safety_tool_position[4*tool_cnt+3]);

       tool_position[tool_cnt] = loc_tool_pos;
       tool_radius[tool_cnt] = shm_safety_tool_position[4*tool_cnt+4];
     }

     printf(" --------------- Importing Data for Tool direction ---------------\n");

     cone_orient(0) = shm_safety_tool_direction[0];
     cone_orient(1) = shm_safety_tool_direction[1];
     cone_orient(2) = shm_safety_tool_direction[2];
     cone_orient.normalize();
     tool_direction_feat = shm_safety_tool_direction[3];
     solid_angle = shm_safety_tool_direction[4];

     double pan_angle = shm_safety_tool_direction[5];
     double tilt_angle = shm_safety_tool_direction[6];
    
      Eigen::Matrix3d tilt_rot, pan_rot;

     tilt_rot.setZero(3,3);
     pan_rot.setZero(3,3);

     tilt_rot(0,0) = cos(tilt_angle);
     tilt_rot(0,2) = sin(tilt_angle);
     tilt_rot(2,0) = -sin(tilt_angle);
     tilt_rot(2,2) = cos(tilt_angle);
     tilt_rot(1,1) = 1;

     pan_rot(0,0) = cos(pan_angle);
     pan_rot(0,1) = -sin(pan_angle);
     pan_rot(1,0) = sin(pan_angle);
     pan_rot(1,1) = cos(pan_angle);
     pan_rot(2,2) = 1;

     tool_rot_matrix = pan_rot*tilt_rot;
    }
    sem_post(sem_safety3);
  }

  // ------------- Safety controller update ----------------
  void SafetyController::update()
  {
       // printf("In Update\n");
     safety_limits_flag = false;

     compute_resultant_force = true;
     transistion_ctr = transistion_ctr + 1;

     safety_error_cnt = 0;
     int try_state=1;
     int try_error_list=1;
    // printf("Brfore semphore\n");
   try_state=sem_trywait(sem_joints_state);
   if(try_state==0)
     {
         printf("In try if\n");
              for (unsigned int j = 0; j < num_joints;j++)
              {
                 printf("%lf Joint Pos\n",shm_joints_pos[j]);
                qr(j)= shm_joints_pos[j];
                dqr(j)=shm_joints_vel[j];
                ddqr(j)=0.0;
                actual_joint_effort(j)=shm_joints_eff[j];

                /*qr(j)=joints_[j].getPosition();

                dqr(j)=joints_[j].getVelocity();
                ddqr(j) = 0.0;
                actual_joint_effort(j) = joints_[j].getEffort();*/
              }
         }
        sem_post(sem_joints_state);
     // }



// //  *** ---------------------- Safety IO Implementation ------------------------ ***
//     bool safety_io_trigerred = false;
// //    for (unsigned int pin_cnt = 0; pin_cnt < shm_safety_in[0]; pin_cnt++)
// //    {
// //      if(shm_safety_in[5*pin_cnt+3] ^ shm_safety_in[5*pin_cnt+5])
// //      {
// //        error_cnt_safety_io[pin_cnt] = error_cnt_safety_io[pin_cnt] + 1;
// //        if (error_cnt_safety_io[pin_cnt] > 2)
// //        {
// //          safety_limits_flag = true;
// //          safety_error_cnt = safety_error_cnt + 1;
// //          safety_error_list[safety_error_cnt][0] = 1;
// //          safety_error_list[safety_error_cnt][1] = 1;
// //          safety_error_list[safety_error_cnt][2] = shm_safety_in[5*pin_cnt+2];
// //          safety_error_list[safety_error_cnt][3] = shm_safety_in[5*pin_cnt+4];
// //          safety_error_list[safety_error_cnt][4] = 0;
// //        }
// //      }
// //      else{
// //        if (!(shm_safety_in[5*pin_cnt+3] & shm_safety_in[5*pin_cnt+5]))
// ////          shm_safety_in[5*pin_cnt+3] == trigger_val[pin_cnt];
// //        {
// //          if(shm_safety_in[5*pin_cnt+1] == 3) // Safe Guard stop
// //          {
// //            safety_limits_flag = true;
// //            safety_error_cnt = safety_error_cnt + 1;
// //            safety_error_list[safety_error_cnt][0] = 1;
// //            safety_error_list[safety_error_cnt][1] = 2;
// //            safety_error_list[safety_error_cnt][2] = shm_safety_in[5*pin_cnt+2];
// //            safety_error_list[safety_error_cnt][3] = shm_safety_in[5*pin_cnt+4];
// //            safety_error_list[safety_error_cnt][4] = 0;
// //          }
// //          else if(shm_safety_in[5*pin_cnt+1] == 2) // Reduced mode
// //          {
// //            reduced_mode_safety = true;
// //            safety_error_cnt = safety_error_cnt + 1;
// //            safety_error_list[safety_error_cnt][0] = 1;
// //            safety_error_list[safety_error_cnt][1] = 3;
// //            safety_error_list[safety_error_cnt][2] = shm_safety_in[5*pin_cnt+2];
// //            safety_error_list[safety_error_cnt][3] = shm_safety_in[5*pin_cnt+4];
// //            safety_error_list[safety_error_cnt][4] = 0;
// //          }
// //          safety_io_trigerred = true;
// //        }
// //      }
// //    }

//     if (safety_io_trigerred == false)
//     {
//       reduced_mode_safety = false;
//     }

// //  ------------------   TCP Kinematics Limit Implementation  ------------------

//     KDL::JntArrayVel dq_array(qr,dqr);
//     int pos_chk = fk_solver_vel->JntToCart(dq_array,cart_pos_links);


 //  *** --------------------- Tool position implementation ------------------------ ***
//     if (pos_chk >= 0)
//     {

//       bool plane_crossed = false;


//       Eigen::Matrix3d tool_flange_orient_mat;
//       Eigen::Vector3d tool_flange_cart_pos(cart_pos_links[num_joints-1].p.p.x(),cart_pos_links[num_joints-1].p.p.y(),cart_pos_links[num_joints-1].p.p.z());
//       transformKDLtoEigen(cart_pos_links[num_joints-1],tool_flange_orient_mat);

//       Eigen::Vector3d elbow_cart_pos(cart_pos_links[num_joints/2].p.p.x(),cart_pos_links[num_joints/2].p.p.y(),cart_pos_links[num_joints/2].p.p.z());

//       for (unsigned int tool_ctr = 0; tool_ctr < num_tools; tool_ctr++)
//       {
//         Eigen::Vector3d tool_cart_pos;
//         Eigen::Vector3d tool_cart_pos_loc = tool_position[tool_ctr];
//         tool_cart_pos = tool_flange_cart_pos + tool_flange_orient_mat*tool_cart_pos_loc;

//         double tool_rad = tool_radius[tool_ctr];

//         for (unsigned int plane_cnt = 0; plane_cnt < num_planes; plane_cnt++)
//         {
//           Eigen::Vector3d normal_dir = plane_normal_dir[plane_cnt];
//           Eigen::Vector3d origin = plane_origin[plane_cnt];
//           double feature = plane_safety_feat[plane_cnt];

//           if (feature != 0.0)
//           {
//             unsigned int itr_max_cnt = 1;
//             if (plane_elbow_restrict[plane_cnt] == 1.0)
//             {
//               itr_max_cnt = 2;
//             }

//             for (unsigned int itr_cnt = 0; itr_cnt < itr_max_cnt; itr_cnt++)
//             {

//               Eigen::Vector3d robot_cart_pos = tool_cart_pos;
//               double robot_safety_rad = tool_rad;

//               if (itr_cnt == 1)
//               {
//                 robot_cart_pos = elbow_cart_pos;
//                 robot_safety_rad = 0.15;
//               }

//               normal_dir.normalize();

//               double dist_from_plane = normal_dir(0)*(robot_cart_pos[0] - origin(0)) + normal_dir(1)*(robot_cart_pos[1] - origin(1)) + normal_dir(2)*(robot_cart_pos[2] - origin(2));

//               if (dist_from_plane > -robot_safety_rad)
//               {
//                 if (feature == 1.0 && normal_mode == true) {
//                   safety_limits_flag = true;
//                   safety_error_cnt = safety_error_cnt + 1;
//                   safety_error_list[safety_error_cnt][0] = 2;   // error in tool position
//                   safety_error_list[safety_error_cnt][1] = 1;   // error while robot operating in normal mode
//                   safety_error_list[safety_error_cnt][2] = plane_cnt+1; // error corresponding to plane
//                   safety_error_list[safety_error_cnt][3] = itr_cnt; // error due to tcp or elbow
//                   safety_error_list[safety_error_cnt][4] = dist_from_plane + robot_safety_rad;
// //                  safety_error_list[safety_error_cnt][4] = tool_ctr+1;   // tool by which it got trigerred
//                 }
//                 else if (feature == 2.0 && reduced_mode == true && transistion_ctr > 500) {
//                   safety_limits_flag = true;
//                   safety_error_cnt = safety_error_cnt + 1;
//                   safety_error_list[safety_error_cnt][0] = 2;   // error in tool position
//                   safety_error_list[safety_error_cnt][1] = 2;   // error while robot operating in normal mode
//                   safety_error_list[safety_error_cnt][2] = plane_cnt+1; // error corresponding to plane
//                   safety_error_list[safety_error_cnt][3] = itr_cnt; // error due to tcp or elbow
//                   safety_error_list[safety_error_cnt][4] = dist_from_plane + robot_safety_rad;
// //                  safety_error_list[safety_error_cnt][4] = tool_ctr+1;   // tool by which it got trigerred
//                 }
//                 else if (feature == 3.0) {
//                   safety_limits_flag = true;
//                   safety_error_cnt = safety_error_cnt + 1;
//                   safety_error_list[safety_error_cnt][0] = 2;   // error in tool position
//                   safety_error_list[safety_error_cnt][1] = 3;   // error while robot operating in normal/reduced mode
//                   safety_error_list[safety_error_cnt][2] = plane_cnt+1; // error corresponding to plane
//                   safety_error_list[safety_error_cnt][3] = itr_cnt; // error due to tcp or elbow
//                   safety_error_list[safety_error_cnt][4] = dist_from_plane + robot_safety_rad;
// //                  safety_error_list[safety_error_cnt][4] = tool_ctr+1;   // tool by which it got trigerred
//                 }
//                 else if (feature == 4.0){

//                   reduced_mode_plane = true;
//                   plane_crossed = true;
//                   safety_error_cnt = safety_error_cnt + 1;
//                   safety_error_list[safety_error_cnt][0] = 2;   // error in tool position
//                   safety_error_list[safety_error_cnt][1] = 4.0;   // error while robot operating in normal/reduced mode
//                   safety_error_list[safety_error_cnt][2] = plane_cnt+1; // error corresponding to plane
//                   safety_error_list[safety_error_cnt][3] = itr_cnt; // error due to tcp or elbow
//                   safety_error_list[safety_error_cnt][4] = dist_from_plane + robot_safety_rad;
// //                  safety_error_list[safety_error_cnt][4] = tool_ctr+1;   // tool by which it got trigerred
//                 }

//               }

//             }

//           }
//         }


//       }

//       if (plane_crossed == false)
//       {
//         reduced_mode_plane = false;
//       }

//     }

    //*** ---------------------- Tool direction implementation ----------------------- ***/

//     if (tool_direction_feat != 0.0)
//     {

//       Eigen::Matrix3d tool_flange_orient_mat;
//       transformKDLtoEigen(cart_pos_links[num_joints-1],tool_flange_orient_mat);

//       Eigen::Vector3d tool_arrow_dir_loc(tool_rot_matrix(0,2),tool_rot_matrix(1,2),tool_rot_matrix(2,2));
//       Eigen::Vector3d tool_arrow_dir_base = tool_flange_orient_mat*tool_arrow_dir_loc;
//       tool_arrow_dir_base.normalize();

//       double angle_between_lines = acos(cone_orient(0)*tool_arrow_dir_base(0)+cone_orient(1)*tool_arrow_dir_base(1)+cone_orient(2)*tool_arrow_dir_base(2));

//       if (angle_between_lines > solid_angle)
//       {
//         if (tool_direction_feat == 1.0 && normal_mode == true) {
//           safety_limits_flag = true;
//           safety_error_cnt = safety_error_cnt + 1;
//           safety_error_list[safety_error_cnt][0] = 3;
//           safety_error_list[safety_error_cnt][1] = 1;
//           safety_error_list[safety_error_cnt][2] = angle_between_lines;
//           safety_error_list[safety_error_cnt][3] = solid_angle;
//           safety_error_list[safety_error_cnt][4] = 0;
//         }
//         else if (tool_direction_feat == 2.0 && reduced_mode == true && transistion_ctr > 500) {
//           safety_limits_flag = true;
//           safety_error_cnt = safety_error_cnt + 1;
//           safety_error_list[safety_error_cnt][0] = 3;
//           safety_error_list[safety_error_cnt][1] = 2;
//           safety_error_list[safety_error_cnt][2] = angle_between_lines;
//           safety_error_list[safety_error_cnt][3] = solid_angle;
//           safety_error_list[safety_error_cnt][4] = 0;
//         }
//         else if (tool_direction_feat == 3.0) {
//           safety_limits_flag = true;
//           safety_error_cnt = safety_error_cnt + 1;
//           safety_error_list[safety_error_cnt][0] = 3;
//           safety_error_list[safety_error_cnt][1] = 3;
//           safety_error_list[safety_error_cnt][2] = angle_between_lines;
//           safety_error_list[safety_error_cnt][3] = solid_angle;
//           safety_error_list[safety_error_cnt][4] = 0;
//         }
//       }

//     }
  printf(" *** ----------------------- Tool linear velocity limit ------------------------- ***\n");

     end_effector_vel = sqrt(cart_pos_links[num_joints+1].p.v.x()*cart_pos_links[num_joints+1].p.v.x() + cart_pos_links[num_joints+1].p.v.y()*cart_pos_links[num_joints+1].p.v.y() + cart_pos_links[num_joints+1].p.v.z()*cart_pos_links[num_joints+1].p.v.z());
      
   
     
     if (reduced_mode == true && transistion_ctr > 500)
     {
       if ( end_effector_vel > fabs(tcp_vel_limit_reduced_mode) )
       {
         
         
            safety_limits_flag = true;
            safety_error_cnt = safety_error_cnt + 1;
            safety_error_list[safety_error_cnt][0] = 4;
            safety_error_list[safety_error_cnt][1] = 2;
            safety_error_list[safety_error_cnt][2] = end_effector_vel;
            safety_error_list[safety_error_cnt][3] = tcp_vel_limit_reduced_mode;
            safety_error_list[safety_error_cnt][4] = 0;
          
       }
     }
     else {
       if ( end_effector_vel > fabs(tcp_vel_limit_normal_mode) )
       {
         safety_limits_flag = true;
         safety_error_cnt = safety_error_cnt + 1;
         safety_error_list[safety_error_cnt][0] = 4;
         safety_error_list[safety_error_cnt][1] = 1;
         safety_error_list[safety_error_cnt][2] = end_effector_vel;
         safety_error_list[safety_error_cnt][3] = tcp_vel_limit_normal_mode;
         safety_error_list[safety_error_cnt][4] = 0;
       }
     }
    
    
   
        

// //   *** --------------------------- Tool Momentum limit ------------------------------- ***

//     if (reduced_mode == true && transistion_ctr > 500)
//     {
//       if ((tool_mass*end_effector_vel) > fabs(tcp_mom_limit_reduced_mode) )
//       {
//         safety_limits_flag = true;
//         safety_error_cnt = safety_error_cnt + 1;
//         safety_error_list[safety_error_cnt][0] = 5;
//         safety_error_list[safety_error_cnt][1] = 2;
//         safety_error_list[safety_error_cnt][2] = tool_mass*end_effector_vel;
//         safety_error_list[safety_error_cnt][3] = tcp_mom_limit_reduced_mode;
//         safety_error_list[safety_error_cnt][4] = 0;
//       }
//     }
//     else {
//       if ((tool_mass*end_effector_vel) > fabs(tcp_mom_limit_normal_mode) )
//       {
//         safety_limits_flag = true;
//         safety_error_cnt = safety_error_cnt + 1;
//         safety_error_list[safety_error_cnt][0] = 5;
//         safety_error_list[safety_error_cnt][1] = 1;
//         safety_error_list[safety_error_cnt][2] = tool_mass*end_effector_vel;
//         safety_error_list[safety_error_cnt][3] = tcp_mom_limit_normal_mode;
//         safety_error_list[safety_error_cnt][4] = 0;
//       }
//     }

// //   *** -------------------------- Robot mechanical power limit ------------------------------ ***

// //    double robot_power = 0;
// //    for (unsigned int jnt_cnt = 0 ; jnt_cnt<num_joints; jnt_cnt++)
// //    {
// //      robot_power = robot_power + fabs(actual_joint_effort(jnt_cnt)/torque_constant[jnt_cnt]*48);
// //    }
// //    if (reduced_mode == true && transistion_ctr > 500)
// //    {
// //      if ( robot_power > robot_power_limit_reduced_mode )
// //      {
// //        safety_limits_flag = true;
// //        safety_error_cnt = safety_error_cnt + 1;
// //        safety_error_list[safety_error_cnt][0] = 6;
// //        safety_error_list[safety_error_cnt][1] = 2;
// //        safety_error_list[safety_error_cnt][2] = robot_power;
// //        safety_error_list[safety_error_cnt][3] = robot_power_limit_reduced_mode;
// //        safety_error_list[safety_error_cnt][4] = 0;
// //      }
// //    }
// //    else {
// //      if ( robot_power > robot_power_limit_normal_mode )
// //      {
// //        safety_limits_flag = true;
// //        safety_error_cnt = safety_error_cnt + 1;
// //        safety_error_list[safety_error_cnt][0] = 6;
// //        safety_error_list[safety_error_cnt][1] = 1;
// //        safety_error_list[safety_error_cnt][2] = robot_power;
// //        safety_error_list[safety_error_cnt][3] = robot_power_limit_normal_mode;
// //        safety_error_list[safety_error_cnt][4] = 0;
// //      }
// //    }


// //   *** -------------------------------- TCP Force limit ------------------------------------ ***

// //    double resultant_force = 0;
// //    if (ft_sensor_present == true)
// //    {
// //      resultant_force = sqrt(ft_sensor_values[0]*ft_sensor_values[0] + ft_sensor_values[1]*ft_sensor_values[1] + ft_sensor_values[2]*ft_sensor_values[2]);
// //    }
// //    else
// //    {
// //      // Creating wrench vector for all the links
// //      KDL::Wrenches tool_flange_arm_wrench_(tool_flange_chain_.getNrOfSegments(),KDL::Wrench::Zero());
// //      KDL::JntArray tool_flange_arm_torque_;
// //      tool_flange_arm_torque_.resize(num_joints);
// //      int solver_tool_flange_chain = joint_effort_solver_tool_flange_chain->CartToJnt(qr,dqr,ddqr,tool_flange_arm_wrench_,tool_flange_arm_torque_);
// //      // if theoretical joint torque are calculated successfully
// //      if (solver_tool_flange_chain >= 0)
// //      {
// //        for(unsigned int jnt_cnt = 0; jnt_cnt<num_joints; jnt_cnt++)
// //        {
// //          tool_flange_arm_torque_(jnt_cnt) = (1+coul_fric_a[jnt_cnt])*tool_flange_arm_torque_(jnt_cnt);
// //        }
// //        KDL::Wrenches tcp_default_arm_wrench_(tcp_default_chain_.getNrOfSegments(),KDL::Wrench::Zero());
// //        joint_effort_solver_tcp_default_chain->CartToJnt(qr,dqr,ddqr,tcp_default_arm_wrench_,actual_joint_effort);
// //        for (unsigned int jnt_cnt = 0; jnt_cnt < num_joints; jnt_cnt++)
// //        {
// //          actual_joint_effort(jnt_cnt) = -actual_joint_effort(jnt_cnt);
// //        }


// //        // conversion from KDL to Eigen
// //        Eigen::VectorXd torq_act, torq_calc, net_torq;
// //        torq_act = actual_joint_effort.data; // actual joint torque
// //        torq_calc = tool_flange_arm_torque_.data; // theoretical joint torque from recursive newton-euler
// //        net_torq = torq_act + torq_calc; // net joint torque

// //        // Evaluating Jacobian and saving it in Eigen format
// //        jacobian_->JntToJac(qr,jac_tmp);
// //        Eigen::MatrixXd jac = jac_tmp.data;

// //        // Evaluating Jacobian inverse using pseudoinverse
// //        Eigen::MatrixXd jac_trans_inv;
// //        pseudo_inverse(jac.transpose(), jac_trans_inv);

// //        // Evaluating effective end effector wrench
// //        Eigen::VectorXd wrench_eef = jac_trans_inv*net_torq;

// //        // calculating resultant net force at end effector
// //        resultant_force = sqrt(wrench_eef(0)*wrench_eef(0) + wrench_eef(1)*wrench_eef(1) + wrench_eef(2)*wrench_eef(2));
// ////        std::cout<<" Resultant force  calc: "<< resultant_force<<std::endl;
// //      }
// //      else {
// //        resultant_force = 0;
// //      }

// //    }


// //    if (compute_resultant_force == true)
// //    {
// ////      std::cout<<" resultant force : "<<resultant_force<<std::endl;
// //      if (reduced_mode == true && transistion_ctr > 500)
// //      {
// //        if ( resultant_force > tcp_force_limit_reduced_mode )
// //        {
// //          safety_limits_flag = true;
// //          safety_error_cnt = safety_error_cnt + 1;
// //          safety_error_list[safety_error_cnt][0] = 7;
// //          safety_error_list[safety_error_cnt][1] = 2;
// //          safety_error_list[safety_error_cnt][2] = resultant_force;
// //          safety_error_list[safety_error_cnt][3] = tcp_force_limit_reduced_mode;
// //          safety_error_list[safety_error_cnt][4] = 0;
// //        }
// //      }
// //      else {
// //        if ( resultant_force > tcp_force_limit_normal_mode )
// //        {
// //          safety_limits_flag = true;
// //          safety_error_cnt = safety_error_cnt + 1;
// //          safety_error_list[safety_error_cnt][0] = 7;
// //          safety_error_list[safety_error_cnt][1] = 1;
// //          safety_error_list[safety_error_cnt][2] = resultant_force;
// //          safety_error_list[safety_error_cnt][3] = tcp_force_limit_normal_mode;
// //          safety_error_list[safety_error_cnt][4] = 0;
// //        }

// //      }
// //    }
// //    else{
// ////      std::cout<<" Robot in singular pose "<<std::endl;
// //    }


     // ************************* ------------------   Joint Limits Implementation  ------------------ *****************************/
  
  
     for (unsigned int jnt_cnt = 0; jnt_cnt < num_joints; jnt_cnt++)
     {
       
      printf("  *** ----------------------------------------- Joint Position limit ----------------------------------------------- ***\n");
      
        printf("Error list in joint limits\n");
       if (reduced_mode == true && transistion_ctr > 500)
       {
         if ( ( qr(jnt_cnt) > joint_max_pos_limit_reduced_mode[jnt_cnt]) || ( qr(jnt_cnt) < joint_min_pos_limit_reduced_mode[jnt_cnt]) )
         {

           safety_limits_flag = true;
           safety_error_cnt = safety_error_cnt + 1;
           safety_error_list[safety_error_cnt][0] = 8;
           safety_error_list[safety_error_cnt][1] = 2;
           safety_error_list[safety_error_cnt][2] = jnt_cnt;
           if ( qr(jnt_cnt) > joint_max_pos_limit_reduced_mode[jnt_cnt])
           {
             safety_error_list[safety_error_cnt][3] = qr(jnt_cnt);
             safety_error_list[safety_error_cnt][4] = joint_max_pos_limit_reduced_mode[jnt_cnt];
           }
           else {
             safety_error_list[safety_error_cnt][3] = qr(jnt_cnt);
             safety_error_list[safety_error_cnt][4] = joint_min_pos_limit_reduced_mode[jnt_cnt];
           }
         }
       }
       else {
         if ( ( qr(jnt_cnt) > joint_max_pos_limit_normal_mode[jnt_cnt]) || ( qr(jnt_cnt) < joint_min_pos_limit_normal_mode[jnt_cnt]) )
         {
           safety_limits_flag = true;
           safety_error_cnt = safety_error_cnt + 1;
           safety_error_list[safety_error_cnt][0] = 8;
           safety_error_list[safety_error_cnt][1] = 1;
           safety_error_list[safety_error_cnt][2] = jnt_cnt;
           if (qr(jnt_cnt) > joint_max_pos_limit_normal_mode[jnt_cnt])
           {
             safety_error_list[safety_error_cnt][3] = qr(jnt_cnt);
             safety_error_list[safety_error_cnt][4] = joint_max_pos_limit_normal_mode[jnt_cnt];
           }
           else {
             safety_error_list[safety_error_cnt][3] = qr(jnt_cnt);
             safety_error_list[safety_error_cnt][4] = joint_min_pos_limit_normal_mode[jnt_cnt];
           }
         }
       }
      
      
      // }
       

    printf("       *** ----------------------------------------- Joint Velocity limit ----------------------------------------------- ***\n");
      
           printf("error list in joint limit velocity\n");
       if (reduced_mode == true && transistion_ctr > 500)
       {
         if ( fabs(dqr(jnt_cnt)) > fabs(joint_vel_limit_reduced_mode[jnt_cnt]) )
         {
           safety_limits_flag = true;
           safety_error_cnt = safety_error_cnt + 1;
           safety_error_list[safety_error_cnt][0] = 9;
           safety_error_list[safety_error_cnt][1] = 2;
           safety_error_list[safety_error_cnt][2] = jnt_cnt;
           safety_error_list[safety_error_cnt][3] = fabs(dqr(jnt_cnt));
           safety_error_list[safety_error_cnt][4] = fabs(joint_vel_limit_reduced_mode[jnt_cnt]);
         }
       }
       else {
         if ( fabs(dqr(jnt_cnt)) > fabs(joint_vel_limit_normal_mode[jnt_cnt]) )
         {
           safety_limits_flag = true;
           safety_error_cnt = safety_error_cnt + 1;
           safety_error_list[safety_error_cnt][0] = 9;
           safety_error_list[safety_error_cnt][1] = 1;
           safety_error_list[safety_error_cnt][2] = jnt_cnt;
           safety_error_list[safety_error_cnt][3] = fabs(dqr(jnt_cnt));
           safety_error_list[safety_error_cnt][4] = fabs(joint_vel_limit_normal_mode[jnt_cnt]);
         }
       }
     
      // }

     }

      // Check whether in singularity or not
      printf("Error list in singularity\n");
     if (underSingularity == true && shm_force_mode_enable[0] == true){ //
       safety_limits_flag = true;
       safety_error_cnt = safety_error_cnt + 1;
       safety_error_list[safety_error_cnt][0] = 10;
       safety_error_list[safety_error_cnt][1] = 1;
       std::cout<<"Under Singularity"<<" shm_recovery_mode_flag "<<*shm_recovery_mode_flag<<std::endl;
     }


     if (too_close_point == true && shm_force_mode_enable[0] == true){ //
       safety_limits_flag = true;
       safety_error_cnt = safety_error_cnt + 1;
       safety_error_list[safety_error_cnt][0] = 11;
       safety_error_list[safety_error_cnt][1] = 1;
       std::cout<<" Too close to origin of selected feature "<<std::endl;
     }
 
  //  }
     printf(" ************************* ------------------ Mode of operation ------------------ *****************************\n");


     if (reduced_mode_plane | reduced_mode_safety)
     {
       reduced_mode = true;
       normal_mode = false;
       if (first_time == true | first_cycle == true)
       {
         red_mode_switch = true;
         normal_mode_switch = false;
         first_time = false;
         first_cycle = false;
         transistion_ctr = 0;
       }
     }
     else{
       reduced_mode = false;
       normal_mode = true;
       if (first_time == false | first_cycle == true)
       {
         normal_mode_switch = true;
         red_mode_switch = false;
         first_time = true;
         first_cycle = false;
         transistion_ctr = 0;
       }
     }

//     if (*shm_recovery_mode_flag == true)
//     {

//       if (safety_limits_flag == false)
//       {
// //        std::cout<<" safety_limits_flag : "<<safety_limits_flag<<std::endl;
//         *shm_recovery_mode_flag = false;
//       }
//       else{
//         safety_error_list[0][0] = safety_error_cnt;

//         shm_safety_error_list[0] = safety_error_list[0][0];
//         for (unsigned int list_cnt = 0; list_cnt < safety_error_list[0][0]; list_cnt++)
//         {
//           shm_safety_error_list[5*list_cnt+1] = safety_error_list[list_cnt+1][0];
//           shm_safety_error_list[5*list_cnt+2] = safety_error_list[list_cnt+1][1];
//           shm_safety_error_list[5*list_cnt+3] = safety_error_list[list_cnt+1][2];
//           shm_safety_error_list[5*list_cnt+4] = safety_error_list[list_cnt+1][3];
//           shm_safety_error_list[5*list_cnt+5] = safety_error_list[list_cnt+1][4];
//           std::cout<<" error_type 1 : "<<shm_safety_error_list[5*list_cnt+1]<<" error_type 2 : "<<shm_safety_error_list[5*list_cnt+2]<<" error_type 3 : "<<shm_safety_error_list[5*list_cnt+3]<<" error_type 4 : "<<shm_safety_error_list[5*list_cnt+4]<<" error_type 5 : "<<shm_safety_error_list[5*list_cnt+5]<<std::endl;
//         }
//         sem_post(sem_safety);
//       }
//     }

     printf(" ************************* ------------------   Implementing Safety Stop  ------------------ *****************************\n");
   try_error_list=sem_trywait(sem_error_list);
   if(try_error_list==0)
   {
     if (safety_limits_flag == true && *shm_recovery_mode_flag == false)
     {

      //stop controller
      std::vector<std::string> controllers = {"effort_trajectory_controller", "safety_controller"};
      if (safety_flag)
      {

        safety_error_list[0][0] = safety_error_cnt;
        //stopControllers(controllers);

        shm_safety_error_list[0] = safety_error_list[0][0];
        for (unsigned int list_cnt = 0; list_cnt < safety_error_list[0][0]; list_cnt++)
        {
          shm_safety_error_list[5*list_cnt+1] = safety_error_list[list_cnt+1][0];
          shm_safety_error_list[5*list_cnt+2] = safety_error_list[list_cnt+1][1];
          shm_safety_error_list[5*list_cnt+3] = safety_error_list[list_cnt+1][2];
          shm_safety_error_list[5*list_cnt+4] = safety_error_list[list_cnt+1][3];
          shm_safety_error_list[5*list_cnt+5] = safety_error_list[list_cnt+1][4];
          std::cout<<" error_type 1 : "<<shm_safety_error_list[5*list_cnt+1]<<" error_type 2 : "<<shm_safety_error_list[5*list_cnt+2]<<" error_type 3 : "<<shm_safety_error_list[5*list_cnt+3]<<" error_type 4 : "<<shm_safety_error_list[5*list_cnt+4]<<" error_type 5 : "<<shm_safety_error_list[5*list_cnt+5]<<std::endl;
        }
        safety_flag = false;

        transistion_ctr = 0;



      }

      *shm_recovery_mode_flag = true;

     }
     else if (red_mode_switch == true) {

       safety_error_list[0][0] = safety_error_cnt;
       shm_safety_error_list[0] = safety_error_list[0][0];
      std::cout<<" ******************* Reduced mode entered **************** "<<std::endl;
       for (unsigned int list_cnt = 0; list_cnt < safety_error_list[0][0]; list_cnt++)
       {
         shm_safety_error_list[5*list_cnt+1] = safety_error_list[list_cnt+1][0];
         shm_safety_error_list[5*list_cnt+2] = safety_error_list[list_cnt+1][1];
         shm_safety_error_list[5*list_cnt+3] = safety_error_list[list_cnt+1][2];
         shm_safety_error_list[5*list_cnt+4] = safety_error_list[list_cnt+1][3];
         shm_safety_error_list[5*list_cnt+5] = safety_error_list[list_cnt+1][4];
        std::cout<<" error_type 1 : "<<shm_safety_error_list[5*list_cnt+1]<<" error_type 2 : "<<shm_safety_error_list[5*list_cnt+2]<<" error_type 3 : "<<shm_safety_error_list[5*list_cnt+3]<<" error_type 4 : "<<shm_safety_error_list[5*list_cnt+4]<<" error_type 5 : "<<shm_safety_error_list[5*list_cnt+5]<<std::endl;
        }

       *shm_mode_of_operation = false;
       red_mode_switch = false;
 

     }
     else if(normal_mode_switch == true)
     {
       std::cout<<" **************** normal mode entered ******************* "<<std::endl;

       *shm_mode_of_operation = true;
       normal_mode_switch = false;
 

     }
    }
      sem_post(sem_error_list);
    // }

  }

  // ------------- Safety controller stopping ----------------
 /* void SafetyController::stopping(const ros::Time &time)
  {

  }

  // ------------- Safety controller stop controller ----------------
  void SafetyController::stopControllers(const std::vector<std::string> controllers){
    controller_manager_msgs::SwitchController srv;
    srv.request.stop_controllers = controllers;
    srv.request.strictness = srv.request.BEST_EFFORT;
    std::thread call(boost::bind(ros::service::call<controller_manager_msgs::SwitchController>, "/svaya/controller_manager/switch_controller", srv));
    call.detach();
  }*/


}

//PLUGINLIB_EXPORT_CLASS(safety_controllers::SafetyController, controller_interface::ControllerBase)



//    *** --------- Touch stop feature ------- ***

////     Force due to payload and torque can be added here directly
//    KDL::Wrenches wrenchNull_arm(kdl_chain_.getNrOfSegments(),KDL::Wrench::Zero());

//    //  calculating the required torque values
//    int solver_chk_touch_stop = joint_effort_solver_chain->CartToJnt(qr, dqr, ddqr, wrenchNull_arm, desired_joint_effort);

//    if(solver_chk_touch_stop >= 0)
//    {

//      for (unsigned int j = 0; j < num_joints; j++)
//      {
//        data_val.data[j] = sent_vel[j];
//      }

//      data_pub.publish(data_val);

  // ---------------- Difference between Desired and Actual value -----------------

//      for (unsigned int j = 0; j < num_joints-1; j++)
//      {
//        if ( fabs (-desired_joint_effort(j) - joints_[j].getEffort()) > joint_effort_threshold[j]  )
         // if ( fabs (-desired_joint_effort(j) - shm_joints_eff[j] > joint_effort_threshold[j]  )
//        {
//          if (windows < 1)
//          {
//            windows_counter = 0;
//          }
//          windows ++;
//        }
//      }

//      windows_counter++;

//      if(windows_counter == 500)
//      {

//        if (windows > 300)
//        {
//          std::cout<<" windows : "<<windows<<std::endl;

//          //stop controller
//          std::vector<std::string> controllers = {"position_trajectory_controller", "force_stop_controller"};
//          if (flag_)
//          {
//            flag_ = false;
//            windows = 0;
//            int try1=sem_trywait(sem1);
//            std::cout<<"Force stop Controller -- Semaphore result : "<<try1<<std::endl;
//            stopControllers(controllers);
//           }
//        }

//        windows_counter = 0;
//        windows = 0;
//      }

//    }

//    else
//    {
//      ROS_ERROR_THROTTLE(1.0,"KT: Failed to compute gravity torques from KDL return code arm %d",solver_chk_touch_stop);
//     }


// if plane criteria is to made radially outward

//          Eigen::Vector3d joint_pos(cart_pos_links[i].p.p.x(),cart_pos_links[i].p.p.y(),cart_pos_links[i].p.p.z());
//          Eigen::Vector3d vec_joint_plane_org = origin - joint_pos;

//          if ((vec_joint_plane_org.dot(normal_dir)) < 0)
//          {
//            if (feature == 0.0)
//            {
//              if (first_print == true)
//              {
//                std::cout<<" robot cross plane :- "<<plane_cnt<<" Disabled mode "<<std::endl;
//              }
//              safety_limits_flag = false;
//            }
//            else if (feature == 1.0 && normal_mode == true) {
//              if (first_print == true)
//              {
//                std::cout<<" robot cross plane :- "<<plane_cnt<<" Normal mode "<<std::endl;
//              }
//              safety_limits_flag = true;
//            }
//            else if (feature == 2.0 && collab_mode == true) {
//              if(first_print == true)
//              {
//                std::cout<<" robot cross plane :- "<<plane_cnt<<" Reduced mode "<<std::endl;
//              }
//              safety_limits_flag = true;
//            }
//            else if (feature == 3.0) {
//              if (first_print == true)
//              {
//                std::cout<<" robot cross plane :- "<<plane_cnt<<" Both "<<std::endl;
//              }
//              safety_limits_flag = true;
//            }
//            else if (feature == 4.0){
//              if (first_print == true)
//              {
//                std::cout<<" robot cross plane :- "<<plane_cnt<<" Reduced mode triggered "<<std::endl;
//              }
//              collab_mode = true;
//              reduced_mode = true;
//              normal_mode = false;

//            }

//            plane_crossed = true;
//            first_print = false;

//          }


