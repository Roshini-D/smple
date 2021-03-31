#ifndef HARDWARE_INTERFACE_
#define HARDWARE_INTERFACE_


// ros_control

#include <hardware_interface/robot_hw.h>
#include <hardware_interface/joint_state_interface.h>
#include <hardware_interface/joint_command_interface.h>
#include <hardware_interface/posvelacc_command_interface.h>
#include <controller_manager/controller_manager.h>
//#include <controller_manager_msgs/SwitchController.h>

#include <joint_limits_interface/joint_limits.h>
#include <joint_limits_interface/joint_limits_interface.h>
#include <joint_limits_interface/joint_limits_rosparam.h>
#include <joint_limits_interface/joint_limits_urdf.h>
#include <pluginlib/class_list_macros.hpp>

// Boost
#include <boost/scoped_ptr.hpp>
// ROS
#include <ros/ros.h>
#include <sensor_msgs/JointState.h>


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

bool reduced_mode = false;

bool safety_flag = true;
bool safety_limits_flag = false;




/*class Safety : public hardware_interface::RobotHW 
{
    public:
        Safety(ros::NodeHandle& nh);
        ~Safety();
        void init();



   protected:
 // Hardware interfaces
        hardware_interface::JointStateInterface joint_state_interface_;
        hardware_interface::EffortJointInterface effort_joint_interface_;
	hardware_interface::VelocityJointInterface velocity_joint_interface_;
        hardware_interface::PositionJointInterface position_joint_interface_;
        
       /* joint_limits_interface::JointLimits limits;
        joint_limits_interface::EffortJointSaturationInterface effortJointSaturationInterface;
        joint_limits_interface::PositionJointSaturationInterface positionJointSaturationInterface;*/
        


	// States
	std::vector<double> joint_position_;
	std::vector<double> joint_velocity_;
	std::vector<double> joint_effort_;

        ros::NodeHandle nh_;
        boost::shared_ptr<controller_manager::ControllerManager> controller_manager_;



















#endif
