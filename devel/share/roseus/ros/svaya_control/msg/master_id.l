;; Auto-generated. Do not edit!


(when (boundp 'svaya_control::master_id)
  (if (not (find-package "SVAYA_CONTROL"))
    (make-package "SVAYA_CONTROL"))
  (shadow 'master_id (find-package "SVAYA_CONTROL")))
(unless (find-package "SVAYA_CONTROL::MASTER_ID")
  (make-package "SVAYA_CONTROL::MASTER_ID"))

(in-package "ROS")
;;//! \htmlinclude master_id.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass svaya_control::master_id
  :super ros::object
  :slots (_header _master_id _data ))

(defmethod svaya_control::master_id
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:master_id __master_id) 0)
    ((:data __data) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _master_id (round __master_id))
   (setq _data (round __data))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:master_id
   (&optional __master_id)
   (if __master_id (setq _master_id __master_id)) _master_id)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _master_id
    4
    ;; int32 _data
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _master_id
       (write-long _master_id s)
     ;; int32 _data
       (write-long _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _master_id
     (setq _master_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _data
     (setq _data (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get svaya_control::master_id :md5sum-) "31929dcb5d32f0ce0b1b86d1d23554be")
(setf (get svaya_control::master_id :datatype-) "svaya_control/master_id")
(setf (get svaya_control::master_id :definition-)
      "Header header
int32 master_id

int32  data



================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :svaya_control/master_id "31929dcb5d32f0ce0b1b86d1d23554be")


