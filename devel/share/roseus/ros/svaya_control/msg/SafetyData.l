;; Auto-generated. Do not edit!


(when (boundp 'svaya_control::SafetyData)
  (if (not (find-package "SVAYA_CONTROL"))
    (make-package "SVAYA_CONTROL"))
  (shadow 'SafetyData (find-package "SVAYA_CONTROL")))
(unless (find-package "SVAYA_CONTROL::SAFETYDATA")
  (make-package "SVAYA_CONTROL::SAFETYDATA"))

(in-package "ROS")
;;//! \htmlinclude SafetyData.msg.html


(defclass svaya_control::SafetyData
  :super ros::object
  :slots (_Robot_limits _JointLimitdata _SafetyPlanedata _Tooldata _SafetyInputIo _underSingularity _too_close_point _safety_flag ))

(defmethod svaya_control::SafetyData
  (:init
   (&key
    ((:Robot_limits __Robot_limits) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:JointLimitdata __JointLimitdata) (let (r) (dotimes (i 0) (push (instance svaya_control::JointLimit :init) r)) r))
    ((:SafetyPlanedata __SafetyPlanedata) (let (r) (dotimes (i 0) (push (instance svaya_control::SafetyPlane :init) r)) r))
    ((:Tooldata __Tooldata) (let (r) (dotimes (i 0) (push (instance svaya_control::Tool :init) r)) r))
    ((:SafetyInputIo __SafetyInputIo) (make-array 0 :initial-element 0 :element-type :integer))
    ((:underSingularity __underSingularity) nil)
    ((:too_close_point __too_close_point) nil)
    ((:safety_flag __safety_flag) nil)
    )
   (send-super :init)
   (setq _Robot_limits __Robot_limits)
   (setq _JointLimitdata __JointLimitdata)
   (setq _SafetyPlanedata __SafetyPlanedata)
   (setq _Tooldata __Tooldata)
   (setq _SafetyInputIo __SafetyInputIo)
   (setq _underSingularity __underSingularity)
   (setq _too_close_point __too_close_point)
   (setq _safety_flag __safety_flag)
   self)
  (:Robot_limits
   (&optional __Robot_limits)
   (if __Robot_limits (setq _Robot_limits __Robot_limits)) _Robot_limits)
  (:JointLimitdata
   (&rest __JointLimitdata)
   (if (keywordp (car __JointLimitdata))
       (send* _JointLimitdata __JointLimitdata)
     (progn
       (if __JointLimitdata (setq _JointLimitdata (car __JointLimitdata)))
       _JointLimitdata)))
  (:SafetyPlanedata
   (&rest __SafetyPlanedata)
   (if (keywordp (car __SafetyPlanedata))
       (send* _SafetyPlanedata __SafetyPlanedata)
     (progn
       (if __SafetyPlanedata (setq _SafetyPlanedata (car __SafetyPlanedata)))
       _SafetyPlanedata)))
  (:Tooldata
   (&rest __Tooldata)
   (if (keywordp (car __Tooldata))
       (send* _Tooldata __Tooldata)
     (progn
       (if __Tooldata (setq _Tooldata (car __Tooldata)))
       _Tooldata)))
  (:SafetyInputIo
   (&optional __SafetyInputIo)
   (if __SafetyInputIo (setq _SafetyInputIo __SafetyInputIo)) _SafetyInputIo)
  (:underSingularity
   (&optional __underSingularity)
   (if __underSingularity (setq _underSingularity __underSingularity)) _underSingularity)
  (:too_close_point
   (&optional __too_close_point)
   (if __too_close_point (setq _too_close_point __too_close_point)) _too_close_point)
  (:safety_flag
   (&optional __safety_flag)
   (if __safety_flag (setq _safety_flag __safety_flag)) _safety_flag)
  (:serialization-length
   ()
   (+
    ;; float64[] _Robot_limits
    (* 8    (length _Robot_limits)) 4
    ;; svaya_control/JointLimit[] _JointLimitdata
    (apply #'+ (send-all _JointLimitdata :serialization-length)) 4
    ;; svaya_control/SafetyPlane[] _SafetyPlanedata
    (apply #'+ (send-all _SafetyPlanedata :serialization-length)) 4
    ;; svaya_control/Tool[] _Tooldata
    (apply #'+ (send-all _Tooldata :serialization-length)) 4
    ;; int32[] _SafetyInputIo
    (* 4    (length _SafetyInputIo)) 4
    ;; bool _underSingularity
    1
    ;; bool _too_close_point
    1
    ;; bool _safety_flag
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _Robot_limits
     (write-long (length _Robot_limits) s)
     (dotimes (i (length _Robot_limits))
       (sys::poke (elt _Robot_limits i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; svaya_control/JointLimit[] _JointLimitdata
     (write-long (length _JointLimitdata) s)
     (dolist (elem _JointLimitdata)
       (send elem :serialize s)
       )
     ;; svaya_control/SafetyPlane[] _SafetyPlanedata
     (write-long (length _SafetyPlanedata) s)
     (dolist (elem _SafetyPlanedata)
       (send elem :serialize s)
       )
     ;; svaya_control/Tool[] _Tooldata
     (write-long (length _Tooldata) s)
     (dolist (elem _Tooldata)
       (send elem :serialize s)
       )
     ;; int32[] _SafetyInputIo
     (write-long (length _SafetyInputIo) s)
     (dotimes (i (length _SafetyInputIo))
       (write-long (elt _SafetyInputIo i) s)
       )
     ;; bool _underSingularity
       (if _underSingularity (write-byte -1 s) (write-byte 0 s))
     ;; bool _too_close_point
       (if _too_close_point (write-byte -1 s) (write-byte 0 s))
     ;; bool _safety_flag
       (if _safety_flag (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _Robot_limits
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _Robot_limits (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _Robot_limits i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; svaya_control/JointLimit[] _JointLimitdata
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _JointLimitdata (let (r) (dotimes (i n) (push (instance svaya_control::JointLimit :init) r)) r))
     (dolist (elem- _JointLimitdata)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; svaya_control/SafetyPlane[] _SafetyPlanedata
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _SafetyPlanedata (let (r) (dotimes (i n) (push (instance svaya_control::SafetyPlane :init) r)) r))
     (dolist (elem- _SafetyPlanedata)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; svaya_control/Tool[] _Tooldata
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _Tooldata (let (r) (dotimes (i n) (push (instance svaya_control::Tool :init) r)) r))
     (dolist (elem- _Tooldata)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; int32[] _SafetyInputIo
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _SafetyInputIo (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _SafetyInputIo i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; bool _underSingularity
     (setq _underSingularity (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _too_close_point
     (setq _too_close_point (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _safety_flag
     (setq _safety_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get svaya_control::SafetyData :md5sum-) "72b89a176f586ae89e501cc07a269f6d")
(setf (get svaya_control::SafetyData :datatype-) "svaya_control/SafetyData")
(setf (get svaya_control::SafetyData :definition-)
      "float64[] Robot_limits

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



(provide :svaya_control/SafetyData "72b89a176f586ae89e501cc07a269f6d")


