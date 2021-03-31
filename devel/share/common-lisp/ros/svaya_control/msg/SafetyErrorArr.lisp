; Auto-generated. Do not edit!


(cl:in-package svaya_control-msg)


;//! \htmlinclude SafetyErrorArr.msg.html

(cl:defclass <SafetyErrorArr> (roslisp-msg-protocol:ros-message)
  ((msgdata
    :reader msgdata
    :initarg :msgdata
    :type (cl:vector svaya_control-msg:SafetyError)
   :initform (cl:make-array 0 :element-type 'svaya_control-msg:SafetyError :initial-element (cl:make-instance 'svaya_control-msg:SafetyError))))
)

(cl:defclass SafetyErrorArr (<SafetyErrorArr>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SafetyErrorArr>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SafetyErrorArr)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name svaya_control-msg:<SafetyErrorArr> is deprecated: use svaya_control-msg:SafetyErrorArr instead.")))

(cl:ensure-generic-function 'msgdata-val :lambda-list '(m))
(cl:defmethod msgdata-val ((m <SafetyErrorArr>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svaya_control-msg:msgdata-val is deprecated.  Use svaya_control-msg:msgdata instead.")
  (msgdata m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SafetyErrorArr>) ostream)
  "Serializes a message object of type '<SafetyErrorArr>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'msgdata))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'msgdata))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SafetyErrorArr>) istream)
  "Deserializes a message object of type '<SafetyErrorArr>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'msgdata) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'msgdata)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'svaya_control-msg:SafetyError))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SafetyErrorArr>)))
  "Returns string type for a message object of type '<SafetyErrorArr>"
  "svaya_control/SafetyErrorArr")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SafetyErrorArr)))
  "Returns string type for a message object of type 'SafetyErrorArr"
  "svaya_control/SafetyErrorArr")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SafetyErrorArr>)))
  "Returns md5sum for a message object of type '<SafetyErrorArr>"
  "dee21b917a60d8be2263a10f8e5c4054")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SafetyErrorArr)))
  "Returns md5sum for a message object of type 'SafetyErrorArr"
  "dee21b917a60d8be2263a10f8e5c4054")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SafetyErrorArr>)))
  "Returns full string definition for message of type '<SafetyErrorArr>"
  (cl:format cl:nil "SafetyError[] msgdata~%~%================================================================================~%MSG: svaya_control/SafetyError~%float64[] error_list~%bool mode_of_operation~%bool recovery_mode_flag~%bool safety_limits_flag~%int32[] status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SafetyErrorArr)))
  "Returns full string definition for message of type 'SafetyErrorArr"
  (cl:format cl:nil "SafetyError[] msgdata~%~%================================================================================~%MSG: svaya_control/SafetyError~%float64[] error_list~%bool mode_of_operation~%bool recovery_mode_flag~%bool safety_limits_flag~%int32[] status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SafetyErrorArr>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'msgdata) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SafetyErrorArr>))
  "Converts a ROS message object to a list"
  (cl:list 'SafetyErrorArr
    (cl:cons ':msgdata (msgdata msg))
))
