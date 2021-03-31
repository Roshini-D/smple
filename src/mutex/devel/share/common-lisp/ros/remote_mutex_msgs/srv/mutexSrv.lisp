; Auto-generated. Do not edit!


(cl:in-package remote_mutex_msgs-srv)


;//! \htmlinclude mutexSrv-request.msg.html

(cl:defclass <mutexSrv-request> (roslisp-msg-protocol:ros-message)
  ((requestor
    :reader requestor
    :initarg :requestor
    :type cl:string
    :initform "")
   (requestType
    :reader requestType
    :initarg :requestType
    :type cl:fixnum
    :initform 0))
)

(cl:defclass mutexSrv-request (<mutexSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mutexSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mutexSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name remote_mutex_msgs-srv:<mutexSrv-request> is deprecated: use remote_mutex_msgs-srv:mutexSrv-request instead.")))

(cl:ensure-generic-function 'requestor-val :lambda-list '(m))
(cl:defmethod requestor-val ((m <mutexSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader remote_mutex_msgs-srv:requestor-val is deprecated.  Use remote_mutex_msgs-srv:requestor instead.")
  (requestor m))

(cl:ensure-generic-function 'requestType-val :lambda-list '(m))
(cl:defmethod requestType-val ((m <mutexSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader remote_mutex_msgs-srv:requestType-val is deprecated.  Use remote_mutex_msgs-srv:requestType instead.")
  (requestType m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<mutexSrv-request>)))
    "Constants for message type '<mutexSrv-request>"
  '((:TYPE_LOCK . 1)
    (:TYPE_UNLOCK . 2)
    (:TYPE_POLL . 3))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'mutexSrv-request)))
    "Constants for message type 'mutexSrv-request"
  '((:TYPE_LOCK . 1)
    (:TYPE_UNLOCK . 2)
    (:TYPE_POLL . 3))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mutexSrv-request>) ostream)
  "Serializes a message object of type '<mutexSrv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'requestor))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'requestor))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'requestType)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mutexSrv-request>) istream)
  "Deserializes a message object of type '<mutexSrv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'requestor) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'requestor) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'requestType)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mutexSrv-request>)))
  "Returns string type for a service object of type '<mutexSrv-request>"
  "remote_mutex_msgs/mutexSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mutexSrv-request)))
  "Returns string type for a service object of type 'mutexSrv-request"
  "remote_mutex_msgs/mutexSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mutexSrv-request>)))
  "Returns md5sum for a message object of type '<mutexSrv-request>"
  "76380b12c62c62b1c75ef04892016d2b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mutexSrv-request)))
  "Returns md5sum for a message object of type 'mutexSrv-request"
  "76380b12c62c62b1c75ef04892016d2b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mutexSrv-request>)))
  "Returns full string definition for message of type '<mutexSrv-request>"
  (cl:format cl:nil "string requestor~%uint8 requestType~%uint8 TYPE_LOCK = 1~%uint8 TYPE_UNLOCK = 2~%uint8 TYPE_POLL = 3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mutexSrv-request)))
  "Returns full string definition for message of type 'mutexSrv-request"
  (cl:format cl:nil "string requestor~%uint8 requestType~%uint8 TYPE_LOCK = 1~%uint8 TYPE_UNLOCK = 2~%uint8 TYPE_POLL = 3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mutexSrv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'requestor))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mutexSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'mutexSrv-request
    (cl:cons ':requestor (requestor msg))
    (cl:cons ':requestType (requestType msg))
))
;//! \htmlinclude mutexSrv-response.msg.html

(cl:defclass <mutexSrv-response> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:fixnum
    :initform 0))
)

(cl:defclass mutexSrv-response (<mutexSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mutexSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mutexSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name remote_mutex_msgs-srv:<mutexSrv-response> is deprecated: use remote_mutex_msgs-srv:mutexSrv-response instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <mutexSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader remote_mutex_msgs-srv:status-val is deprecated.  Use remote_mutex_msgs-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<mutexSrv-response>)))
    "Constants for message type '<mutexSrv-response>"
  '((:STATUS_LOCKED . 1)
    (:STATUS_UNLOCKED . 0))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'mutexSrv-response)))
    "Constants for message type 'mutexSrv-response"
  '((:STATUS_LOCKED . 1)
    (:STATUS_UNLOCKED . 0))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mutexSrv-response>) ostream)
  "Serializes a message object of type '<mutexSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mutexSrv-response>) istream)
  "Deserializes a message object of type '<mutexSrv-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mutexSrv-response>)))
  "Returns string type for a service object of type '<mutexSrv-response>"
  "remote_mutex_msgs/mutexSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mutexSrv-response)))
  "Returns string type for a service object of type 'mutexSrv-response"
  "remote_mutex_msgs/mutexSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mutexSrv-response>)))
  "Returns md5sum for a message object of type '<mutexSrv-response>"
  "76380b12c62c62b1c75ef04892016d2b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mutexSrv-response)))
  "Returns md5sum for a message object of type 'mutexSrv-response"
  "76380b12c62c62b1c75ef04892016d2b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mutexSrv-response>)))
  "Returns full string definition for message of type '<mutexSrv-response>"
  (cl:format cl:nil "uint8 status~%uint8 STATUS_LOCKED = 1~%uint8 STATUS_UNLOCKED = 0 ~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mutexSrv-response)))
  "Returns full string definition for message of type 'mutexSrv-response"
  (cl:format cl:nil "uint8 status~%uint8 STATUS_LOCKED = 1~%uint8 STATUS_UNLOCKED = 0 ~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mutexSrv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mutexSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'mutexSrv-response
    (cl:cons ':status (status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'mutexSrv)))
  'mutexSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'mutexSrv)))
  'mutexSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mutexSrv)))
  "Returns string type for a service object of type '<mutexSrv>"
  "remote_mutex_msgs/mutexSrv")