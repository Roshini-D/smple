# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "svaya_control: 8 messages, 0 services")

set(MSG_I_FLAGS "-Isvaya_control:/home/safety_control/src/svaya_safety/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(svaya_control_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyData.msg" NAME_WE)
add_custom_target(_svaya_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "svaya_control" "/home/safety_control/src/svaya_safety/msg/SafetyData.msg" "svaya_control/JointLimit:svaya_control/SafetyPlane:svaya_control/Tool"
)

get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyPlane.msg" NAME_WE)
add_custom_target(_svaya_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "svaya_control" "/home/safety_control/src/svaya_safety/msg/SafetyPlane.msg" ""
)

get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyErrorArr.msg" NAME_WE)
add_custom_target(_svaya_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "svaya_control" "/home/safety_control/src/svaya_safety/msg/SafetyErrorArr.msg" "svaya_control/SafetyError"
)

get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyDataArr.msg" NAME_WE)
add_custom_target(_svaya_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "svaya_control" "/home/safety_control/src/svaya_safety/msg/SafetyDataArr.msg" "svaya_control/JointLimit:svaya_control/SafetyPlane:svaya_control/Tool:svaya_control/SafetyData"
)

get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyError.msg" NAME_WE)
add_custom_target(_svaya_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "svaya_control" "/home/safety_control/src/svaya_safety/msg/SafetyError.msg" ""
)

get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/JointLimit.msg" NAME_WE)
add_custom_target(_svaya_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "svaya_control" "/home/safety_control/src/svaya_safety/msg/JointLimit.msg" ""
)

get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/Tool.msg" NAME_WE)
add_custom_target(_svaya_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "svaya_control" "/home/safety_control/src/svaya_safety/msg/Tool.msg" ""
)

get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/master_id.msg" NAME_WE)
add_custom_target(_svaya_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "svaya_control" "/home/safety_control/src/svaya_safety/msg/master_id.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyData.msg"
  "${MSG_I_FLAGS}"
  "/home/safety_control/src/svaya_safety/msg/JointLimit.msg;/home/safety_control/src/svaya_safety/msg/SafetyPlane.msg;/home/safety_control/src/svaya_safety/msg/Tool.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/svaya_control
)
_generate_msg_cpp(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyPlane.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/svaya_control
)
_generate_msg_cpp(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyErrorArr.msg"
  "${MSG_I_FLAGS}"
  "/home/safety_control/src/svaya_safety/msg/SafetyError.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/svaya_control
)
_generate_msg_cpp(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyDataArr.msg"
  "${MSG_I_FLAGS}"
  "/home/safety_control/src/svaya_safety/msg/JointLimit.msg;/home/safety_control/src/svaya_safety/msg/SafetyPlane.msg;/home/safety_control/src/svaya_safety/msg/Tool.msg;/home/safety_control/src/svaya_safety/msg/SafetyData.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/svaya_control
)
_generate_msg_cpp(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyError.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/svaya_control
)
_generate_msg_cpp(svaya_control
  "/home/safety_control/src/svaya_safety/msg/JointLimit.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/svaya_control
)
_generate_msg_cpp(svaya_control
  "/home/safety_control/src/svaya_safety/msg/Tool.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/svaya_control
)
_generate_msg_cpp(svaya_control
  "/home/safety_control/src/svaya_safety/msg/master_id.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/svaya_control
)

### Generating Services

### Generating Module File
_generate_module_cpp(svaya_control
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/svaya_control
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(svaya_control_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(svaya_control_generate_messages svaya_control_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyData.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_cpp _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyPlane.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_cpp _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyErrorArr.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_cpp _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyDataArr.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_cpp _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyError.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_cpp _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/JointLimit.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_cpp _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/Tool.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_cpp _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/master_id.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_cpp _svaya_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(svaya_control_gencpp)
add_dependencies(svaya_control_gencpp svaya_control_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS svaya_control_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyData.msg"
  "${MSG_I_FLAGS}"
  "/home/safety_control/src/svaya_safety/msg/JointLimit.msg;/home/safety_control/src/svaya_safety/msg/SafetyPlane.msg;/home/safety_control/src/svaya_safety/msg/Tool.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/svaya_control
)
_generate_msg_eus(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyPlane.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/svaya_control
)
_generate_msg_eus(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyErrorArr.msg"
  "${MSG_I_FLAGS}"
  "/home/safety_control/src/svaya_safety/msg/SafetyError.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/svaya_control
)
_generate_msg_eus(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyDataArr.msg"
  "${MSG_I_FLAGS}"
  "/home/safety_control/src/svaya_safety/msg/JointLimit.msg;/home/safety_control/src/svaya_safety/msg/SafetyPlane.msg;/home/safety_control/src/svaya_safety/msg/Tool.msg;/home/safety_control/src/svaya_safety/msg/SafetyData.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/svaya_control
)
_generate_msg_eus(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyError.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/svaya_control
)
_generate_msg_eus(svaya_control
  "/home/safety_control/src/svaya_safety/msg/JointLimit.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/svaya_control
)
_generate_msg_eus(svaya_control
  "/home/safety_control/src/svaya_safety/msg/Tool.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/svaya_control
)
_generate_msg_eus(svaya_control
  "/home/safety_control/src/svaya_safety/msg/master_id.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/svaya_control
)

### Generating Services

### Generating Module File
_generate_module_eus(svaya_control
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/svaya_control
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(svaya_control_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(svaya_control_generate_messages svaya_control_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyData.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_eus _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyPlane.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_eus _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyErrorArr.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_eus _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyDataArr.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_eus _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyError.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_eus _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/JointLimit.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_eus _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/Tool.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_eus _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/master_id.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_eus _svaya_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(svaya_control_geneus)
add_dependencies(svaya_control_geneus svaya_control_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS svaya_control_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyData.msg"
  "${MSG_I_FLAGS}"
  "/home/safety_control/src/svaya_safety/msg/JointLimit.msg;/home/safety_control/src/svaya_safety/msg/SafetyPlane.msg;/home/safety_control/src/svaya_safety/msg/Tool.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/svaya_control
)
_generate_msg_lisp(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyPlane.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/svaya_control
)
_generate_msg_lisp(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyErrorArr.msg"
  "${MSG_I_FLAGS}"
  "/home/safety_control/src/svaya_safety/msg/SafetyError.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/svaya_control
)
_generate_msg_lisp(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyDataArr.msg"
  "${MSG_I_FLAGS}"
  "/home/safety_control/src/svaya_safety/msg/JointLimit.msg;/home/safety_control/src/svaya_safety/msg/SafetyPlane.msg;/home/safety_control/src/svaya_safety/msg/Tool.msg;/home/safety_control/src/svaya_safety/msg/SafetyData.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/svaya_control
)
_generate_msg_lisp(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyError.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/svaya_control
)
_generate_msg_lisp(svaya_control
  "/home/safety_control/src/svaya_safety/msg/JointLimit.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/svaya_control
)
_generate_msg_lisp(svaya_control
  "/home/safety_control/src/svaya_safety/msg/Tool.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/svaya_control
)
_generate_msg_lisp(svaya_control
  "/home/safety_control/src/svaya_safety/msg/master_id.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/svaya_control
)

### Generating Services

### Generating Module File
_generate_module_lisp(svaya_control
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/svaya_control
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(svaya_control_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(svaya_control_generate_messages svaya_control_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyData.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_lisp _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyPlane.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_lisp _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyErrorArr.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_lisp _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyDataArr.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_lisp _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyError.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_lisp _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/JointLimit.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_lisp _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/Tool.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_lisp _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/master_id.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_lisp _svaya_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(svaya_control_genlisp)
add_dependencies(svaya_control_genlisp svaya_control_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS svaya_control_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyData.msg"
  "${MSG_I_FLAGS}"
  "/home/safety_control/src/svaya_safety/msg/JointLimit.msg;/home/safety_control/src/svaya_safety/msg/SafetyPlane.msg;/home/safety_control/src/svaya_safety/msg/Tool.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/svaya_control
)
_generate_msg_nodejs(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyPlane.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/svaya_control
)
_generate_msg_nodejs(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyErrorArr.msg"
  "${MSG_I_FLAGS}"
  "/home/safety_control/src/svaya_safety/msg/SafetyError.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/svaya_control
)
_generate_msg_nodejs(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyDataArr.msg"
  "${MSG_I_FLAGS}"
  "/home/safety_control/src/svaya_safety/msg/JointLimit.msg;/home/safety_control/src/svaya_safety/msg/SafetyPlane.msg;/home/safety_control/src/svaya_safety/msg/Tool.msg;/home/safety_control/src/svaya_safety/msg/SafetyData.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/svaya_control
)
_generate_msg_nodejs(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyError.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/svaya_control
)
_generate_msg_nodejs(svaya_control
  "/home/safety_control/src/svaya_safety/msg/JointLimit.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/svaya_control
)
_generate_msg_nodejs(svaya_control
  "/home/safety_control/src/svaya_safety/msg/Tool.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/svaya_control
)
_generate_msg_nodejs(svaya_control
  "/home/safety_control/src/svaya_safety/msg/master_id.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/svaya_control
)

### Generating Services

### Generating Module File
_generate_module_nodejs(svaya_control
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/svaya_control
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(svaya_control_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(svaya_control_generate_messages svaya_control_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyData.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_nodejs _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyPlane.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_nodejs _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyErrorArr.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_nodejs _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyDataArr.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_nodejs _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyError.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_nodejs _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/JointLimit.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_nodejs _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/Tool.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_nodejs _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/master_id.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_nodejs _svaya_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(svaya_control_gennodejs)
add_dependencies(svaya_control_gennodejs svaya_control_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS svaya_control_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyData.msg"
  "${MSG_I_FLAGS}"
  "/home/safety_control/src/svaya_safety/msg/JointLimit.msg;/home/safety_control/src/svaya_safety/msg/SafetyPlane.msg;/home/safety_control/src/svaya_safety/msg/Tool.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/svaya_control
)
_generate_msg_py(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyPlane.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/svaya_control
)
_generate_msg_py(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyErrorArr.msg"
  "${MSG_I_FLAGS}"
  "/home/safety_control/src/svaya_safety/msg/SafetyError.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/svaya_control
)
_generate_msg_py(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyDataArr.msg"
  "${MSG_I_FLAGS}"
  "/home/safety_control/src/svaya_safety/msg/JointLimit.msg;/home/safety_control/src/svaya_safety/msg/SafetyPlane.msg;/home/safety_control/src/svaya_safety/msg/Tool.msg;/home/safety_control/src/svaya_safety/msg/SafetyData.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/svaya_control
)
_generate_msg_py(svaya_control
  "/home/safety_control/src/svaya_safety/msg/SafetyError.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/svaya_control
)
_generate_msg_py(svaya_control
  "/home/safety_control/src/svaya_safety/msg/JointLimit.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/svaya_control
)
_generate_msg_py(svaya_control
  "/home/safety_control/src/svaya_safety/msg/Tool.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/svaya_control
)
_generate_msg_py(svaya_control
  "/home/safety_control/src/svaya_safety/msg/master_id.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/svaya_control
)

### Generating Services

### Generating Module File
_generate_module_py(svaya_control
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/svaya_control
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(svaya_control_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(svaya_control_generate_messages svaya_control_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyData.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_py _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyPlane.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_py _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyErrorArr.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_py _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyDataArr.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_py _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/SafetyError.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_py _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/JointLimit.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_py _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/Tool.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_py _svaya_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/safety_control/src/svaya_safety/msg/master_id.msg" NAME_WE)
add_dependencies(svaya_control_generate_messages_py _svaya_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(svaya_control_genpy)
add_dependencies(svaya_control_genpy svaya_control_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS svaya_control_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/svaya_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/svaya_control
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(svaya_control_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(svaya_control_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/svaya_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/svaya_control
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(svaya_control_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(svaya_control_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/svaya_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/svaya_control
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(svaya_control_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(svaya_control_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/svaya_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/svaya_control
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(svaya_control_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(svaya_control_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/svaya_control)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/svaya_control\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/svaya_control
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(svaya_control_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(svaya_control_generate_messages_py sensor_msgs_generate_messages_py)
endif()
