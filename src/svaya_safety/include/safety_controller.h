#ifndef Force_Stop_Controller_H_
#define Force_Stop_Controller_H_

#include <std_msgs/Float32.h>
#include <std_msgs/Bool.h>
//#include <realtime_tools/realtime_publisher.h>
#include <boost/scoped_ptr.hpp>

#include <ros/node_handle.h>

#include <urdf/model.h>
//#include <control_toolbox/pid.h>
#include <boost/scoped_ptr.hpp>
#include <boost/thread/condition.hpp>
//#include <hardware_interface/joint_command_interface.h>
//#include <controller_interface/controller.h>
//#include <realtime_tools/realtime_buffer.h>
#include <sensor_msgs/JointState.h>
#include <std_msgs/Float64MultiArray.h>
#include "kdl_urdf_parser.h"

//#include <controller_manager_msgs/SwitchController.h>
//#include <dynamic_reconfigure/server.h>

#include <trajectory_msgs/JointTrajectoryPoint.h>

#include <Eigen/Core>
#include <Eigen/Dense>
#include <Eigen/Geometry>

#include <kdl/chainidsolver_recursive_newton_euler.hpp>
#include <kdl/frames.hpp>
#include <kdl_parser/kdl_parser.hpp>
#include <kdl/jntarray.hpp>
#include <kdl/jntarrayvel.hpp>
#include <kdl/chainiksolverpos_nr_jl.hpp>
#include <kdl/chainiksolvervel_pinv.hpp>
#include <kdl/chainfksolverpos_recursive.hpp>
#include <kdl/chainfksolvervel_recursive.hpp>
#include <kdl/chainidsolver_recursive_newton_euler.hpp>
#include <kdl/chainjnttojacsolver.hpp>
#include <kdl/jacobian.hpp>

#include <Eigen/Core>
#include <Eigen/LU>
#include <Eigen/SVD>

#include <vector>
#include <tf/transform_listener.h>
#include <tf_conversions/tf_kdl.h>
#include <tf/transform_datatypes.h>

#include <fcntl.h>          
#include<semaphore.h>

int *shm_digital_in;
int *shm_digital_out;
int *shm_analog_io;
int *shm_safety_in;
int *shm_safety_out;

int *shm_force_mode_data;
bool *shm_force_mode_enable;
bool *shm_mode_of_operation;
bool *shm_recovery_mode_flag;

double *shm_safety_plane_data;
double *shm_safety_tool_position;
double *shm_safety_tool_direction;
double *shm_safety_joint_limits;
double *shm_safety_robot_limits;
double *shm_safety_error_list;


double *shm_joints_pos;
double *shm_joints_vel;
double *shm_joints_eff;
sem_t *sem_safety;
sem_t *sem_safety1;
sem_t *sem_safety2;
sem_t *sem_safety3;
sem_t *sem_joints_state;
sem_t *sem_error_list;
sem_t *safety_in_access;
sem_t *safety_out_access;


bool reduced_mode = false;

bool safety_flag = true;
bool safety_limits_flag = false;
bool underSingularity;
bool too_close_point;
ros::Duration desired_update_freq_;
	double cycle_time_error_threshold_;

	ros::Duration elapsed_time_;
	double loop_hz_=1000.0;
	struct timespec last_time_;
	struct timespec current_time_;

namespace safety_controllers
{
  typedef struct INFO
  {
    std::vector<std::string> link_names;
    std::vector<std::string> joint_names;
  }KinematicSolverInfo;

  class SafetyController:  public KdlUrdfParser
  {
    public:
      SafetyController();
      ~SafetyController();

      bool init( ros::NodeHandle &n);
      void starting();
      void update();
    //  void stopping(const ros::Time& time);
      void pseudo_inverse(const Eigen::MatrixXd &M_, Eigen::MatrixXd &M_pinv_);
      void transformKDLtoEigen(const KDL::FrameVel &k, Eigen::Matrix3d &e);

     // void stopControllers(const std::vector<std::string> controllers);

    private:

      ros::NodeHandle node_;
      ros::NodeHandle nh_;
//      hardware_interface::JointStateInterface *robot_;
      boost::scoped_ptr<KDL::ChainJntToJacSolver> jacobian_;

//      std::vector<hardware_interface::JointStateHandle> joints_;

      ros::Publisher data_pub;
      std_msgs::Float64MultiArray data_val;

      // Desired joint position velocity and acceleration
      KDL::JntArray q; // desired joint position values
      KDL::JntArray dq; // desired joint velocity values
      KDL::JntArray ddq; // desired joint acceleration values

      // Actual joint position velocity and acceleration
      KDL::JntArray qr; // recieved joint position values
      KDL::JntArray dqr; // recieved joint velocities values
      KDL::JntArray ddqr; // recieved joint acceleration values

      // Recieved joint effort values
      KDL::JntArray actual_joint_effort;

      // Desired joint effort values
      KDL::JntArray desired_joint_effort;

      bool compute_resultant_force;
      std::vector<KDL::FrameVel> cart_pos_links;
      KDL::JntArrayVel dq_array;

      std::vector<int> error_cnt_safety_io;

      std::string name_;
      std::vector<std::string> joint_names_;

      bool reduced_mode_safety, reduced_mode_plane;

      KDL::Chain tcp_default_chain_; // Entire KDL chain from base to tcp_default
      KDL::Chain tool_flange_chain_; // KDL chain till Tool Flange
      unsigned int num_joints; // number of joints in robot

      KDL::Jacobian jac_tmp; // variable for storing Jacobian

      // Recursive newton-euler solver from base to tool flange
      KDL::ChainIdSolver_RNE *joint_effort_solver_tool_flange_chain;
      KDL::ChainIdSolver_RNE *joint_effort_solver_tcp_default_chain;

      // Forward kinematics solver
      KDL::ChainFkSolverVel *fk_solver_vel;

      bool ft_sensor_present; // FT sensor present on robot or not
//      bool reduced_mode; // reduced mode setting on or not
      bool collab_mode; // boolean to determine setting is enabled for collaborative mode or not
      bool normal_mode; // normal mode operation
      bool enable_reduced_mode; // enable reduced mode or not
      Eigen::VectorXd ft_curr_val; // current value of ft sensor
      bool elbow_chk;

      int windows;
      int windows_counter;
      bool first_print = false;
      int transistion_ctr;

      double end_effector_vel; //  linear velocity of the end effector

      std::vector <unsigned int> joint_id_safety;

//      ***-------- Variables related to plane ----------***

      // vector to store plane data
      std::vector<std::vector<double>> plane_data;
      // number of planes for safety
      unsigned int num_planes;
      // 0:- Disabled, 1:- Normal, 2:- Reduced, 3:- Both, 4:- Trigger Reduced mode
      std::vector<double> plane_safety_feat;
      // Vector for storing plane origin
      std::vector<Eigen::Vector3d> plane_origin;
      // Vector for storing plane normal direction
      std::vector<Eigen::Vector3d> plane_normal_dir;
      // Vector to store elbow restrict is disabled on enabled for particular plane
      std::vector<double> plane_elbow_restrict;

//      ***-------- Variables related to tool position ----------***

      // vector to store tool data
      std::vector<Eigen::Vector3d> tool_position;
      // vector to store tool radius
      std::vector<double> tool_radius;
      // number of tools to check for safety
      unsigned int num_tools;

//      ***-------- Variables related to tool direction ----------***
      Eigen::Vector3d cone_orient;
      double tool_direction_feat, solid_angle;
      Eigen::Matrix3d tool_rot_matrix;

//      ***-------- TCP velocity limit for reduced and normal mode ----------***
      double tcp_vel_limit_reduced_mode, tcp_vel_limit_normal_mode;

//      ***-------- TCP momentum limit for reduced and normal mode ----------***
      double tcp_mom_limit_reduced_mode, tcp_mom_limit_normal_mode;

//      ***-------- TCP force limit for reduced and normal mode ----------***
      double tcp_force_limit_reduced_mode, tcp_force_limit_normal_mode;

//      ***-------- Robot power limit for reduced and normal mode ----------***
      double robot_power_limit_reduced_mode, robot_power_limit_normal_mode;

//      ***-------- Joint max and min position limit for collaborative mode and reduced mode ----------***
      std::vector<double> joint_max_pos_limit_reduced_mode, joint_min_pos_limit_reduced_mode;
      std::vector<double> joint_max_pos_limit_normal_mode, joint_min_pos_limit_normal_mode;

//      ***-------- Joint velocity limit for collaborative mode and reduced mode ----------***
      std::vector<double> joint_vel_limit_reduced_mode, joint_vel_limit_normal_mode;

      double visc_fric_[7] = {10,0,3,0,5,3.5,18};
      double coul_fric_a[7] = {-0.3,-0.3,-0.3,-0.3,-0.3,-0.3,-0.1};
      double coul_fric_b[7] = {0,7,4,4,2.5,2,2};

      double joint_effort_threshold[7] = {60.0,40.0,40.0,50.0,30.0,50.0,0.0};

      double torque_constant[7] = {0.108,0.187,0.103,0.103,0.58,0.58,0.58};

      unsigned int safety_error_cnt;

      bool first_time, red_mode_switch, normal_mode_switch, first_cycle;

      std::vector<std::vector<double>> safety_error_list;

      bool robot_disable_flag;
      int try_safety_robot_limit=1,try_safety_joint_limit=1, try_safety_plane=1,try_tool=1;
  };
}


#endif
