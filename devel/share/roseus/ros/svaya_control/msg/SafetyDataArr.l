;; Auto-generated. Do not edit!


(when (boundp 'svaya_control::SafetyDataArr)
  (if (not (find-package "SVAYA_CONTROL"))
    (make-package "SVAYA_CONTROL"))
  (shadow 'SafetyDataArr (find-package "SVAYA_CONTROL")))
(unless (find-package "SVAYA_CONTROL::SAFETYDATAARR")
  (make-package "SVAYA_CONTROL::SAFETYDATAARR"))

(in-package "ROS")
;;//! \htmlinclude SafetyDataArr.msg.html


(defclass svaya_control::SafetyDataArr
  :super ros::object
  :slots (_msgdata ))

(defmethod svaya_control::SafetyDataArr
  (:init
   (&key
    ((:msgdata __msgdata) (let (r) (dotimes (i 0) (push (instance svaya_control::SafetyData :init) r)) r))
    )
   (send-super :init)
   (setq _msgdata __msgdata)
   self)
  (:msgdata
   (&rest __msgdata)
   (if (keywordp (car __msgdata))
       (send* _msgdata __msgdata)
     (progn
       (if __msgdata (setq _msgdata (car __msgdata)))
       _msgdata)))
  (:serialization-length
   ()
   (+
    ;; svaya_control/SafetyData[] _msgdata
    (apply #'+ (send-all _msgdata :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; svaya_control/SafetyData[] _msgdata
     (write-long (length _msgdata) s)
     (dolist (elem _msgdata)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; svaya_control/SafetyData[] _msgdata
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _msgdata (let (r) (dotimes (i n) (push (instance svaya_control::SafetyData :init) r)) r))
     (dolist (elem- _msgdata)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get svaya_control::SafetyDataArr :md5sum-) "81b65946d816237f6be348b30fb1605b")
(setf (get svaya_control::SafetyDataArr :datatype-) "svaya_control/SafetyDataArr")
(setf (get svaya_control::SafetyDataArr :definition-)
      "SafetyData[] msgdata

================================================================================
MSG: svaya_control/SafetyData
float64[] Robot_limits

JointLimit[] JointLimitdata 

SafetyPlane[] SafetyPlanedata

Tool[]   Tooldata

int32[] SafetyInputIo

bool underSingularity
bool too_close_point 
bool safety_flag



================================================================================
MSG: svaya_control/JointLimit
uint8 joint_cnt
float64[] joint_max_pos_limit_normal_mode
float64[] joint_min_pos_limit_normal_mode
float64[] joint_max_pos_limit_reduced_mode
float64[] joint_min_pos_limit_reduced_mode
float64[] joint_vel_limit_reduced_mode
float64[] joint_vel_limit_normal_mode


================================================================================
MSG: svaya_control/SafetyPlane
uint8 plane_cnt
float64[]  plane_origin_x
float64[]  plane_origin_y
float64[]  plane_origin_z

float64[]  normal_dir_x
float64[]  normal_dir_y
float64[]  normal_dir_z

float64[]  safety_feat
float64[]  elbow_restrict

================================================================================
MSG: svaya_control/Tool
uint8 tool_cnt
float64[]  tool_position_x
float64[]  tool_position_y
float64[]  tool_position_z
float64[]  tool_radius

float64  cone_orient_x
float64  cone_orient_y
float64  cone_orient_z
float64  tool_direction_feat
float64  solid_angle
float64  pan_angle
float64  tilt_angle


")



(provide :svaya_control/SafetyDataArr "81b65946d816237f6be348b30fb1605b")


