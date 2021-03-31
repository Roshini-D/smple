; Auto-generated. Do not edit!


(cl:in-package svaya_control-msg)


;//! \htmlinclude SafetyData.msg.html

(cl:defclass <SafetyData> (roslisp-msg-protocol:ros-message)
  ((Robot_limits
    :reader Robot_limits
    :initarg :Robot_limits
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (JointLimitdata
    :reader JointLimitdata
    :initarg :JointLimitdata
    :type (cl:vector svaya_control-msg:JointLimit)
   :initform (cl:make-array 0 :element-type 'svaya_control-msg:JointLimit :initial-element (cl:make-instance 'svaya_control-msg:JointLimit)))
   (SafetyPlanedata
    :reader SafetyPlanedata
    :initarg :SafetyPlanedata
    :type (cl:vector svaya_control-msg:SafetyPlane)
   :initform (cl:make-array 0 :element-type 'svaya_control-msg:SafetyPlane :initial-element (cl:make-instance 'svaya_control-msg:SafetyPlane)))
   (Tooldata
    :reader Tooldata
    :initarg :Tooldata
    :type (cl:vector svaya_control-msg:Tool)
   :initform (cl:make-array 0 :element-type 'svaya_control-msg:Tool :initial-element (cl:make-instance 'svaya_control-msg:Tool)))
   (SafetyInputIo
    :reader SafetyInputIo
    :initarg :SafetyInputIo
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (underSingularity
    :reader underSingularity
    :initarg :underSingularity
    :type cl:boolean
    :initform cl:nil)
   (too_close_point
    :reader too_close_point
    :initarg :too_close_point
    :type cl:boolean
    :initform cl:nil)
   (safety_flag
    :reader safety_flag
    :initarg :safety_flag
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SafetyData (<SafetyData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SafetyData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SafetyData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name svaya_control-msg:<SafetyData> is deprecated: use svaya_control-msg:SafetyData instead.")))

(cl:ensure-generic-function 'Robot_limits-val :lambda-list '(m))
(cl:defmethod Robot_limits-val ((m <SafetyData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svaya_control-msg:Robot_limits-val is deprecated.  Use svaya_control-msg:Robot_limits instead.")
  (Robot_limits m))

(cl:ensure-generic-function 'JointLimitdata-val :lambda-list '(m))
(cl:defmethod JointLimitdata-val ((m <SafetyData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svaya_control-msg:JointLimitdata-val is deprecated.  Use svaya_control-msg:JointLimitdata instead.")
  (JointLimitdata m))

(cl:ensure-generic-function 'SafetyPlanedata-val :lambda-list '(m))
(cl:defmethod SafetyPlanedata-val ((m <SafetyData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svaya_control-msg:SafetyPlanedata-val is deprecated.  Use svaya_control-msg:SafetyPlanedata instead.")
  (SafetyPlanedata m))

(cl:ensure-generic-function 'Tooldata-val :lambda-list '(m))
(cl:defmethod Tooldata-val ((m <SafetyData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svaya_control-msg:Tooldata-val is deprecated.  Use svaya_control-msg:Tooldata instead.")
  (Tooldata m))

(cl:ensure-generic-function 'SafetyInputIo-val :lambda-list '(m))
(cl:defmethod SafetyInputIo-val ((m <SafetyData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svaya_control-msg:SafetyInputIo-val is deprecated.  Use svaya_control-msg:SafetyInputIo instead.")
  (SafetyInputIo m))

(cl:ensure-generic-function 'underSingularity-val :lambda-list '(m))
(cl:defmethod underSingularity-val ((m <SafetyData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svaya_control-msg:underSingularity-val is deprecated.  Use svaya_control-msg:underSingularity instead.")
  (underSingularity m))

(cl:ensure-generic-function 'too_close_point-val :lambda-list '(m))
(cl:defmethod too_close_point-val ((m <SafetyData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svaya_control-msg:too_close_point-val is deprecated.  Use svaya_control-msg:too_close_point instead.")
  (too_close_point m))

(cl:ensure-generic-function 'safety_flag-val :lambda-list '(m))
(cl:defmethod safety_flag-val ((m <SafetyData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svaya_control-msg:safety_flag-val is deprecated.  Use svaya_control-msg:safety_flag instead.")
  (safety_flag m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SafetyData>) ostream)
  "Serializes a message object of type '<SafetyData>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'Robot_limits))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'Robot_limits))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'JointLimitdata))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'JointLimitdata))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'SafetyPlanedata))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'SafetyPlanedata))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'Tooldata))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'Tooldata))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'SafetyInputIo))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'SafetyInputIo))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'underSingularity) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'too_close_point) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'safety_flag) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SafetyData>) istream)
  "Deserializes a message object of type '<SafetyData>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'Robot_limits) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'Robot_limits)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'JointLimitdata) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'JointLimitdata)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'svaya_control-msg:JointLimit))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'SafetyPlanedata) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'SafetyPlanedata)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'svaya_control-msg:SafetyPlane))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'Tooldata) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'Tooldata)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'svaya_control-msg:Tool))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'SafetyInputIo) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'SafetyInputIo)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
    (cl:setf (cl:slot-value msg 'underSingularity) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'too_close_point) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'safety_flag) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SafetyData>)))
  "Returns string type for a message object of type '<SafetyData>"
  "svaya_control/SafetyData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SafetyData)))
  "Returns string type for a message object of type 'SafetyData"
  "svaya_control/SafetyData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SafetyData>)))
  "Returns md5sum for a message object of type '<SafetyData>"
  "72b89a176f586ae89e501cc07a269f6d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SafetyData)))
  "Returns md5sum for a message object of type 'SafetyData"
  "72b89a176f586ae89e501cc07a269f6d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SafetyData>)))
  "Returns full string definition for message of type '<SafetyData>"
  (cl:format cl:nil "float64[] Robot_limits~%~%JointLimit[] JointLimitdata ~%~%SafetyPlane[] SafetyPlanedata~%~%Tool[]   Tooldata~%~%int32[] SafetyInputIo~%~%bool underSingularity~%bool too_close_point ~%bool safety_flag~%~%~%~%================================================================================~%MSG: svaya_control/JointLimit~%uint8 joint_cnt~%float64[] joint_max_pos_limit_normal_mode~%float64[] joint_min_pos_limit_normal_mode~%float64[] joint_max_pos_limit_reduced_mode~%float64[] joint_min_pos_limit_reduced_mode~%float64[] joint_vel_limit_reduced_mode~%float64[] joint_vel_limit_normal_mode~%~%~%================================================================================~%MSG: svaya_control/SafetyPlane~%uint8 plane_cnt~%float64[]  plane_origin_x~%float64[]  plane_origin_y~%float64[]  plane_origin_z~%~%float64[]  normal_dir_x~%float64[]  normal_dir_y~%float64[]  normal_dir_z~%~%float64[]  safety_feat~%float64[]  elbow_restrict~%~%================================================================================~%MSG: svaya_control/Tool~%uint8 tool_cnt~%float64[]  tool_position_x~%float64[]  tool_position_y~%float64[]  tool_position_z~%float64[]  tool_radius~%~%float64  cone_orient_x~%float64  cone_orient_y~%float64  cone_orient_z~%float64  tool_direction_feat~%float64  solid_angle~%float64  pan_angle~%float64  tilt_angle~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SafetyData)))
  "Returns full string definition for message of type 'SafetyData"
  (cl:format cl:nil "float64[] Robot_limits~%~%JointLimit[] JointLimitdata ~%~%SafetyPlane[] SafetyPlanedata~%~%Tool[]   Tooldata~%~%int32[] SafetyInputIo~%~%bool underSingularity~%bool too_close_point ~%bool safety_flag~%~%~%~%================================================================================~%MSG: svaya_control/JointLimit~%uint8 joint_cnt~%float64[] joint_max_pos_limit_normal_mode~%float64[] joint_min_pos_limit_normal_mode~%float64[] joint_max_pos_limit_reduced_mode~%float64[] joint_min_pos_limit_reduced_mode~%float64[] joint_vel_limit_reduced_mode~%float64[] joint_vel_limit_normal_mode~%~%~%================================================================================~%MSG: svaya_control/SafetyPlane~%uint8 plane_cnt~%float64[]  plane_origin_x~%float64[]  plane_origin_y~%float64[]  plane_origin_z~%~%float64[]  normal_dir_x~%float64[]  normal_dir_y~%float64[]  normal_dir_z~%~%float64[]  safety_feat~%float64[]  elbow_restrict~%~%================================================================================~%MSG: svaya_control/Tool~%uint8 tool_cnt~%float64[]  tool_position_x~%float64[]  tool_position_y~%float64[]  tool_position_z~%float64[]  tool_radius~%~%float64  cone_orient_x~%float64  cone_orient_y~%float64  cone_orient_z~%float64  tool_direction_feat~%float64  solid_angle~%float64  pan_angle~%float64  tilt_angle~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SafetyData>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'Robot_limits) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'JointLimitdata) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'SafetyPlanedata) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'Tooldata) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'SafetyInputIo) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SafetyData>))
  "Converts a ROS message object to a list"
  (cl:list 'SafetyData
    (cl:cons ':Robot_limits (Robot_limits msg))
    (cl:cons ':JointLimitdata (JointLimitdata msg))
    (cl:cons ':SafetyPlanedata (SafetyPlanedata msg))
    (cl:cons ':Tooldata (Tooldata msg))
    (cl:cons ':SafetyInputIo (SafetyInputIo msg))
    (cl:cons ':underSingularity (underSingularity msg))
    (cl:cons ':too_close_point (too_close_point msg))
    (cl:cons ':safety_flag (safety_flag msg))
))
