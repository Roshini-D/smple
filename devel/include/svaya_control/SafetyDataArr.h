// Generated by gencpp from file svaya_control/SafetyDataArr.msg
// DO NOT EDIT!


#ifndef SVAYA_CONTROL_MESSAGE_SAFETYDATAARR_H
#define SVAYA_CONTROL_MESSAGE_SAFETYDATAARR_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <svaya_control/SafetyData.h>

namespace svaya_control
{
template <class ContainerAllocator>
struct SafetyDataArr_
{
  typedef SafetyDataArr_<ContainerAllocator> Type;

  SafetyDataArr_()
    : msgdata()  {
    }
  SafetyDataArr_(const ContainerAllocator& _alloc)
    : msgdata(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector< ::svaya_control::SafetyData_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::svaya_control::SafetyData_<ContainerAllocator> >::other >  _msgdata_type;
  _msgdata_type msgdata;





  typedef boost::shared_ptr< ::svaya_control::SafetyDataArr_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::svaya_control::SafetyDataArr_<ContainerAllocator> const> ConstPtr;

}; // struct SafetyDataArr_

typedef ::svaya_control::SafetyDataArr_<std::allocator<void> > SafetyDataArr;

typedef boost::shared_ptr< ::svaya_control::SafetyDataArr > SafetyDataArrPtr;
typedef boost::shared_ptr< ::svaya_control::SafetyDataArr const> SafetyDataArrConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::svaya_control::SafetyDataArr_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::svaya_control::SafetyDataArr_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::svaya_control::SafetyDataArr_<ContainerAllocator1> & lhs, const ::svaya_control::SafetyDataArr_<ContainerAllocator2> & rhs)
{
  return lhs.msgdata == rhs.msgdata;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::svaya_control::SafetyDataArr_<ContainerAllocator1> & lhs, const ::svaya_control::SafetyDataArr_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace svaya_control

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::svaya_control::SafetyDataArr_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::svaya_control::SafetyDataArr_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::svaya_control::SafetyDataArr_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::svaya_control::SafetyDataArr_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::svaya_control::SafetyDataArr_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::svaya_control::SafetyDataArr_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::svaya_control::SafetyDataArr_<ContainerAllocator> >
{
  static const char* value()
  {
    return "81b65946d816237f6be348b30fb1605b";
  }

  static const char* value(const ::svaya_control::SafetyDataArr_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x81b65946d816237fULL;
  static const uint64_t static_value2 = 0x6be348b30fb1605bULL;
};

template<class ContainerAllocator>
struct DataType< ::svaya_control::SafetyDataArr_<ContainerAllocator> >
{
  static const char* value()
  {
    return "svaya_control/SafetyDataArr";
  }

  static const char* value(const ::svaya_control::SafetyDataArr_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::svaya_control::SafetyDataArr_<ContainerAllocator> >
{
  static const char* value()
  {
    return "SafetyData[] msgdata\n"
"\n"
"================================================================================\n"
"MSG: svaya_control/SafetyData\n"
"float64[] Robot_limits\n"
"\n"
"JointLimit[] JointLimitdata \n"
"\n"
"SafetyPlane[] SafetyPlanedata\n"
"\n"
"Tool[]   Tooldata\n"
"\n"
"int32[] SafetyInputIo\n"
"\n"
"bool underSingularity\n"
"bool too_close_point \n"
"bool safety_flag\n"
"\n"
"\n"
"\n"
"================================================================================\n"
"MSG: svaya_control/JointLimit\n"
"uint8 joint_cnt\n"
"float64[] joint_max_pos_limit_normal_mode\n"
"float64[] joint_min_pos_limit_normal_mode\n"
"float64[] joint_max_pos_limit_reduced_mode\n"
"float64[] joint_min_pos_limit_reduced_mode\n"
"float64[] joint_vel_limit_reduced_mode\n"
"float64[] joint_vel_limit_normal_mode\n"
"\n"
"\n"
"================================================================================\n"
"MSG: svaya_control/SafetyPlane\n"
"uint8 plane_cnt\n"
"float64[]  plane_origin_x\n"
"float64[]  plane_origin_y\n"
"float64[]  plane_origin_z\n"
"\n"
"float64[]  normal_dir_x\n"
"float64[]  normal_dir_y\n"
"float64[]  normal_dir_z\n"
"\n"
"float64[]  safety_feat\n"
"float64[]  elbow_restrict\n"
"\n"
"================================================================================\n"
"MSG: svaya_control/Tool\n"
"uint8 tool_cnt\n"
"float64[]  tool_position_x\n"
"float64[]  tool_position_y\n"
"float64[]  tool_position_z\n"
"float64[]  tool_radius\n"
"\n"
"float64  cone_orient_x\n"
"float64  cone_orient_y\n"
"float64  cone_orient_z\n"
"float64  tool_direction_feat\n"
"float64  solid_angle\n"
"float64  pan_angle\n"
"float64  tilt_angle\n"
"\n"
;
  }

  static const char* value(const ::svaya_control::SafetyDataArr_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::svaya_control::SafetyDataArr_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.msgdata);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SafetyDataArr_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::svaya_control::SafetyDataArr_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::svaya_control::SafetyDataArr_<ContainerAllocator>& v)
  {
    s << indent << "msgdata[]" << std::endl;
    for (size_t i = 0; i < v.msgdata.size(); ++i)
    {
      s << indent << "  msgdata[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::svaya_control::SafetyData_<ContainerAllocator> >::stream(s, indent + "    ", v.msgdata[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // SVAYA_CONTROL_MESSAGE_SAFETYDATAARR_H