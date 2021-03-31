#ifndef KDL_URDF_PARSER_H_
#define KDL_URDF_PARSER_H_

#include <ros/node_handle.h>
#include <ros/ros.h>

#include <kdl/tree.hpp>
#include <kdl/kdl.hpp>
#include <kdl/chain.hpp>
#include <kdl/chainfksolver.hpp>
#include <kdl/frames.hpp>
#include <kdl/chaindynparam.hpp>
#include <kdl/chainjnttojacsolver.hpp>
#include <kdl/chainfksolverpos_recursive.hpp>
#include <kdl_parser/kdl_parser.hpp>
#include <urdf/model.h>
#include <kdl/jntarrayacc.hpp>
#include <kdl/jntarray.hpp>
#include <urdf/model.h>
#include <vector>

class KdlUrdfParser
{
public:
  KdlUrdfParser(){}
  ~KdlUrdfParser(){}

  bool parser()
  {
    ros::NodeHandle n;

    std::string robot_description;

    if (!ros::param::search(n.getNamespace(),"robot_description", robot_description))
    {
      ROS_ERROR_STREAM("KinematicChainControllerBase: No robot description (URDF) found on parameter server ("<<n.getNamespace()<<"/robot_description)");
      return false;
    }

    if (!n.getParam("/svaya/first_link", first_link))
    {
      ROS_ERROR_STREAM("KinematicChainControllerBase: No first_link found on parameter server ");
      return false;
    }

    if (!n.getParam("/svaya/last_link", last_link))
    {
        ROS_ERROR_STREAM("KinematicChainControllerBase: No last_link found on parameter server ");
        return false;
    }

    if (!n.getParam("/svaya/tcp_link", tcp_link))
    {
        ROS_ERROR_STREAM("KinematicChainControllerBase: No tcp_link found on parameter server ");
        return false;
    }

    gravity_ = KDL::Vector::Zero();
    gravity_(2) = -9.81;

    // Construct an URDF model from the xml string
    std::string xml_string;

    if (n.hasParam(robot_description))
      n.getParam(robot_description.c_str(), xml_string);
    else
    {
      ROS_ERROR("Parameter %s not set, shutting down node...", robot_description.c_str());
      n.shutdown();
      return false;
    }

    if (xml_string.size() == 0)
    {
      ROS_ERROR("Unable to load robot model from parameter %s",robot_description.c_str());
      n.shutdown();
      return false;
    }

    //ROS_INFO("%s content\n%s", robot_description.c_str(), xml_string.c_str());

    // Get urdf model out of robot_description
    urdf::Model model;
    if (!model.initString(xml_string))
    {
      ROS_ERROR("Failed to parse urdf file");
      n.shutdown();
      return false;
    }
    ROS_INFO("Successfully parsed urdf file");

    if (!kdl_parser::treeFromUrdfModel(model, kdl_tree_))
    {
      ROS_ERROR("Failed to construct kdl tree");
      n.shutdown();
      return false;
    }

    std::shared_ptr<const urdf::Link> tool_link_ = model.getLink("tool_link");
    tool_mass = tool_link_->inertial->mass;

    return true;

  }

protected:
  KDL::Tree kdl_tree_;
  KDL::Vector gravity_;
  KDL::JntArrayAcc joint_msr_states_, joint_des_states_;
  double tool_mass;

  struct limits_
  {
    KDL::JntArray min;
    KDL::JntArray max;
    KDL::JntArray center;
  }joint_pos_limits_;

  KDL::JntArray joint_effort_limit_, joint_vel_limit_;

  std::string first_link, last_link, tcp_link;
};

#endif
