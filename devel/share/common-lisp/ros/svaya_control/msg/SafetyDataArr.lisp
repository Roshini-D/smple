; Auto-generated. Do not edit!


(cl:in-package svaya_control-msg)


;//! \htmlinclude SafetyDataArr.msg.html

(cl:defclass <SafetyDataArr> (roslisp-msg-protocol:ros-message)
  ((msgdata
    :reader msgdata
    :initarg :msgdata
    :type (cl:vector svaya_control-msg:SafetyData)
   :initform (cl:make-array 0 :element-type 'svaya_control-msg:SafetyData :initial-element (cl:make-instance 'svaya_control-msg:SafetyData))))
)

(cl:defclass SafetyDataArr (<SafetyDataArr>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SafetyDataArr>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SafetyDataArr)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name svaya_control-msg:<SafetyDataArr> is deprecated: use svaya_control-msg:SafetyDataArr instead.")))

(cl:ensure-generic-function 'msgdata-val :lambda-list '(m))
(cl:defmethod msgdata-val ((m <SafetyDataArr>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svaya_control-msg:msgdata-val is deprecated.  Use svaya_control-msg:msgdata instead.")
  (msgdata m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SafetyDataArr>) ostream)
  "Serializes a message object of type '<SafetyDataArr>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'msgdata))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'msgdata))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SafetyDataArr>) istream)
  "Deserializes a message object of type '<SafetyDataArr>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'msgdata) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'msgdata)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'svaya_control-msg:SafetyData))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SafetyDataArr>)))
  "Returns string type for a message object of type '<SafetyDataArr>"
  "svaya_control/SafetyDataArr")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SafetyDataArr)))
  "Returns string type for a message object of type 'SafetyDataArr"
  "svaya_control/SafetyDataArr")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SafetyDataArr>)))
  "Returns md5sum for a message object of type '<SafetyDataArr>"
  "81b65946d816237f6be348b30fb1605b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SafetyDataArr)))
  "Returns md5sum for a message object of type 'SafetyDataArr"
  "81b65946d816237f6be348b30fb1605b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SafetyDataArr>)))
  "Returns full string definition for message of type '<SafetyDataArr>"
  (cl:format cl:nil "SafetyData[] msgdata~%~%================================================================================~%MSG: svaya_control/SafetyData~%float64[] Robot_limits~%~%JointLimit[] JointLimitdata ~%~%SafetyPlane[] SafetyPlanedata~%~%Tool[]   Tooldata~%~%int32[] SafetyInputIo~%~%bool underSingularity~%bool too_close_point ~%bool safety_flag~%~%~%~%================================================================================~%MSG: svaya_control/JointLimit~%uint8 joint_cnt~%float64[] joint_max_pos_limit_normal_mode~%float64[] joint_min_pos_limit_normal_mode~%float64[] joint_max_pos_limit_reduced_mode~%float64[] joint_min_pos_limit_reduced_mode~%float64[] joint_vel_limit_reduced_mode~%float64[] joint_vel_limit_normal_mode~%~%~%================================================================================~%MSG: svaya_control/SafetyPlane~%uint8 plane_cnt~%float64[]  plane_origin_x~%float64[]  plane_origin_y~%float64[]  plane_origin_z~%~%float64[]  normal_dir_x~%float64[]  normal_dir_y~%float64[]  normal_dir_z~%~%float64[]  safety_feat~%float64[]  elbow_restrict~%~%================================================================================~%MSG: svaya_control/Tool~%uint8 tool_cnt~%float64[]  tool_position_x~%float64[]  tool_position_y~%float64[]  tool_position_z~%float64[]  tool_radius~%~%float64  cone_orient_x~%float64  cone_orient_y~%float64  cone_orient_z~%float64  tool_direction_feat~%float64  solid_angle~%float64  pan_angle~%float64  tilt_angle~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SafetyDataArr)))
  "Returns full string definition for message of type 'SafetyDataArr"
  (cl:format cl:nil "SafetyData[] msgdata~%~%================================================================================~%MSG: svaya_control/SafetyData~%float64[] Robot_limits~%~%JointLimit[] JointLimitdata ~%~%SafetyPlane[] SafetyPlanedata~%~%Tool[]   Tooldata~%~%int32[] SafetyInputIo~%~%bool underSingularity~%bool too_close_point ~%bool safety_flag~%~%~%~%================================================================================~%MSG: svaya_control/JointLimit~%uint8 joint_cnt~%float64[] joint_max_pos_limit_normal_mode~%float64[] joint_min_pos_limit_normal_mode~%float64[] joint_max_pos_limit_reduced_mode~%float64[] joint_min_pos_limit_reduced_mode~%float64[] joint_vel_limit_reduced_mode~%float64[] joint_vel_limit_normal_mode~%~%~%================================================================================~%MSG: svaya_control/SafetyPlane~%uint8 plane_cnt~%float64[]  plane_origin_x~%float64[]  plane_origin_y~%float64[]  plane_origin_z~%~%float64[]  normal_dir_x~%float64[]  normal_dir_y~%float64[]  normal_dir_z~%~%float64[]  safety_feat~%float64[]  elbow_restrict~%~%================================================================================~%MSG: svaya_control/Tool~%uint8 tool_cnt~%float64[]  tool_position_x~%float64[]  tool_position_y~%float64[]  tool_position_z~%float64[]  tool_radius~%~%float64  cone_orient_x~%float64  cone_orient_y~%float64  cone_orient_z~%float64  tool_direction_feat~%float64  solid_angle~%float64  pan_angle~%float64  tilt_angle~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SafetyDataArr>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'msgdata) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SafetyDataArr>))
  "Converts a ROS message object to a list"
  (cl:list 'SafetyDataArr
    (cl:cons ':msgdata (msgdata msg))
))
