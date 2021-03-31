; Auto-generated. Do not edit!


(cl:in-package svaya_control-msg)


;//! \htmlinclude SafetyError.msg.html

(cl:defclass <SafetyError> (roslisp-msg-protocol:ros-message)
  ((error_list
    :reader error_list
    :initarg :error_list
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (mode_of_operation
    :reader mode_of_operation
    :initarg :mode_of_operation
    :type cl:boolean
    :initform cl:nil)
   (recovery_mode_flag
    :reader recovery_mode_flag
    :initarg :recovery_mode_flag
    :type cl:boolean
    :initform cl:nil)
   (safety_limits_flag
    :reader safety_limits_flag
    :initarg :safety_limits_flag
    :type cl:boolean
    :initform cl:nil)
   (status
    :reader status
    :initarg :status
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass SafetyError (<SafetyError>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SafetyError>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SafetyError)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name svaya_control-msg:<SafetyError> is deprecated: use svaya_control-msg:SafetyError instead.")))

(cl:ensure-generic-function 'error_list-val :lambda-list '(m))
(cl:defmethod error_list-val ((m <SafetyError>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svaya_control-msg:error_list-val is deprecated.  Use svaya_control-msg:error_list instead.")
  (error_list m))

(cl:ensure-generic-function 'mode_of_operation-val :lambda-list '(m))
(cl:defmethod mode_of_operation-val ((m <SafetyError>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svaya_control-msg:mode_of_operation-val is deprecated.  Use svaya_control-msg:mode_of_operation instead.")
  (mode_of_operation m))

(cl:ensure-generic-function 'recovery_mode_flag-val :lambda-list '(m))
(cl:defmethod recovery_mode_flag-val ((m <SafetyError>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svaya_control-msg:recovery_mode_flag-val is deprecated.  Use svaya_control-msg:recovery_mode_flag instead.")
  (recovery_mode_flag m))

(cl:ensure-generic-function 'safety_limits_flag-val :lambda-list '(m))
(cl:defmethod safety_limits_flag-val ((m <SafetyError>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svaya_control-msg:safety_limits_flag-val is deprecated.  Use svaya_control-msg:safety_limits_flag instead.")
  (safety_limits_flag m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <SafetyError>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svaya_control-msg:status-val is deprecated.  Use svaya_control-msg:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SafetyError>) ostream)
  "Serializes a message object of type '<SafetyError>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'error_list))))
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
   (cl:slot-value msg 'error_list))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'mode_of_operation) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'recovery_mode_flag) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'safety_limits_flag) 1 0)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'status))))
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
   (cl:slot-value msg 'status))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SafetyError>) istream)
  "Deserializes a message object of type '<SafetyError>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'error_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'error_list)))
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
    (cl:setf (cl:slot-value msg 'mode_of_operation) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'recovery_mode_flag) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'safety_limits_flag) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'status) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'status)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SafetyError>)))
  "Returns string type for a message object of type '<SafetyError>"
  "svaya_control/SafetyError")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SafetyError)))
  "Returns string type for a message object of type 'SafetyError"
  "svaya_control/SafetyError")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SafetyError>)))
  "Returns md5sum for a message object of type '<SafetyError>"
  "effb15012df92429b21d6d9d6f7df6c3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SafetyError)))
  "Returns md5sum for a message object of type 'SafetyError"
  "effb15012df92429b21d6d9d6f7df6c3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SafetyError>)))
  "Returns full string definition for message of type '<SafetyError>"
  (cl:format cl:nil "float64[] error_list~%bool mode_of_operation~%bool recovery_mode_flag~%bool safety_limits_flag~%int32[] status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SafetyError)))
  "Returns full string definition for message of type 'SafetyError"
  (cl:format cl:nil "float64[] error_list~%bool mode_of_operation~%bool recovery_mode_flag~%bool safety_limits_flag~%int32[] status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SafetyError>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'error_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     1
     1
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'status) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SafetyError>))
  "Converts a ROS message object to a list"
  (cl:list 'SafetyError
    (cl:cons ':error_list (error_list msg))
    (cl:cons ':mode_of_operation (mode_of_operation msg))
    (cl:cons ':recovery_mode_flag (recovery_mode_flag msg))
    (cl:cons ':safety_limits_flag (safety_limits_flag msg))
    (cl:cons ':status (status msg))
))
