# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "remote_mutex_msgs: 0 messages, 1 services")

set(MSG_I_FLAGS "")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(remote_mutex_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/aiu/Documents/safety/src/mutex/src/remote_mutex_msgs/srv/mutexSrv.srv" NAME_WE)
add_custom_target(_remote_mutex_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "remote_mutex_msgs" "/home/aiu/Documents/safety/src/mutex/src/remote_mutex_msgs/srv/mutexSrv.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(remote_mutex_msgs
  "/home/aiu/Documents/safety/src/mutex/src/remote_mutex_msgs/srv/mutexSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/remote_mutex_msgs
)

### Generating Module File
_generate_module_cpp(remote_mutex_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/remote_mutex_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(remote_mutex_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(remote_mutex_msgs_generate_messages remote_mutex_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/aiu/Documents/safety/src/mutex/src/remote_mutex_msgs/srv/mutexSrv.srv" NAME_WE)
add_dependencies(remote_mutex_msgs_generate_messages_cpp _remote_mutex_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(remote_mutex_msgs_gencpp)
add_dependencies(remote_mutex_msgs_gencpp remote_mutex_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS remote_mutex_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(remote_mutex_msgs
  "/home/aiu/Documents/safety/src/mutex/src/remote_mutex_msgs/srv/mutexSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/remote_mutex_msgs
)

### Generating Module File
_generate_module_eus(remote_mutex_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/remote_mutex_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(remote_mutex_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(remote_mutex_msgs_generate_messages remote_mutex_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/aiu/Documents/safety/src/mutex/src/remote_mutex_msgs/srv/mutexSrv.srv" NAME_WE)
add_dependencies(remote_mutex_msgs_generate_messages_eus _remote_mutex_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(remote_mutex_msgs_geneus)
add_dependencies(remote_mutex_msgs_geneus remote_mutex_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS remote_mutex_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(remote_mutex_msgs
  "/home/aiu/Documents/safety/src/mutex/src/remote_mutex_msgs/srv/mutexSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/remote_mutex_msgs
)

### Generating Module File
_generate_module_lisp(remote_mutex_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/remote_mutex_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(remote_mutex_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(remote_mutex_msgs_generate_messages remote_mutex_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/aiu/Documents/safety/src/mutex/src/remote_mutex_msgs/srv/mutexSrv.srv" NAME_WE)
add_dependencies(remote_mutex_msgs_generate_messages_lisp _remote_mutex_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(remote_mutex_msgs_genlisp)
add_dependencies(remote_mutex_msgs_genlisp remote_mutex_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS remote_mutex_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(remote_mutex_msgs
  "/home/aiu/Documents/safety/src/mutex/src/remote_mutex_msgs/srv/mutexSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/remote_mutex_msgs
)

### Generating Module File
_generate_module_nodejs(remote_mutex_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/remote_mutex_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(remote_mutex_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(remote_mutex_msgs_generate_messages remote_mutex_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/aiu/Documents/safety/src/mutex/src/remote_mutex_msgs/srv/mutexSrv.srv" NAME_WE)
add_dependencies(remote_mutex_msgs_generate_messages_nodejs _remote_mutex_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(remote_mutex_msgs_gennodejs)
add_dependencies(remote_mutex_msgs_gennodejs remote_mutex_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS remote_mutex_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(remote_mutex_msgs
  "/home/aiu/Documents/safety/src/mutex/src/remote_mutex_msgs/srv/mutexSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/remote_mutex_msgs
)

### Generating Module File
_generate_module_py(remote_mutex_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/remote_mutex_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(remote_mutex_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(remote_mutex_msgs_generate_messages remote_mutex_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/aiu/Documents/safety/src/mutex/src/remote_mutex_msgs/srv/mutexSrv.srv" NAME_WE)
add_dependencies(remote_mutex_msgs_generate_messages_py _remote_mutex_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(remote_mutex_msgs_genpy)
add_dependencies(remote_mutex_msgs_genpy remote_mutex_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS remote_mutex_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/remote_mutex_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/remote_mutex_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/remote_mutex_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/remote_mutex_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/remote_mutex_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/remote_mutex_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/remote_mutex_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/remote_mutex_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/remote_mutex_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/remote_mutex_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/remote_mutex_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
