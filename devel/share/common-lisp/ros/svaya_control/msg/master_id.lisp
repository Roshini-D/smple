; Auto-generated. Do not edit!


(cl:in-package svaya_control-msg)


;//! \htmlinclude master_id.msg.html

(cl:defclass <master_id> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (master_id
    :reader master_id
    :initarg :master_id
    :type cl:integer
    :initform 0)
   (data
    :reader data
    :initarg :data
    :type cl:integer
    :initform 0))
)

(cl:defclass master_id (<master_id>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <master_id>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'master_id)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name svaya_control-msg:<master_id> is deprecated: use svaya_control-msg:master_id instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <master_id>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svaya_control-msg:header-val is deprecated.  Use svaya_control-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'master_id-val :lambda-list '(m))
(cl:defmethod master_id-val ((m <master_id>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svaya_control-msg:master_id-val is deprecated.  Use svaya_control-msg:master_id instead.")
  (master_id m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <master_id>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svaya_control-msg:data-val is deprecated.  Use svaya_control-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <master_id>) ostream)
  "Serializes a message object of type '<master_id>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'master_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'data)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <master_id>) istream)
  "Deserializes a message object of type '<master_id>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'master_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<master_id>)))
  "Returns string type for a message object of type '<master_id>"
  "svaya_control/master_id")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'master_id)))
  "Returns string type for a message object of type 'master_id"
  "svaya_control/master_id")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<master_id>)))
  "Returns md5sum for a message object of type '<master_id>"
  "31929dcb5d32f0ce0b1b86d1d23554be")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'master_id)))
  "Returns md5sum for a message object of type 'master_id"
  "31929dcb5d32f0ce0b1b86d1d23554be")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<master_id>)))
  "Returns full string definition for message of type '<master_id>"
  (cl:format cl:nil "Header header~%int32 master_id~%~%int32  data~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'master_id)))
  "Returns full string definition for message of type 'master_id"
  (cl:format cl:nil "Header header~%int32 master_id~%~%int32  data~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <master_id>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <master_id>))
  "Converts a ROS message object to a list"
  (cl:list 'master_id
    (cl:cons ':header (header msg))
    (cl:cons ':master_id (master_id msg))
    (cl:cons ':data (data msg))
))
