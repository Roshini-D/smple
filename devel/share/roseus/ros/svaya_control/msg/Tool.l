;; Auto-generated. Do not edit!


(when (boundp 'svaya_control::Tool)
  (if (not (find-package "SVAYA_CONTROL"))
    (make-package "SVAYA_CONTROL"))
  (shadow 'Tool (find-package "SVAYA_CONTROL")))
(unless (find-package "SVAYA_CONTROL::TOOL")
  (make-package "SVAYA_CONTROL::TOOL"))

(in-package "ROS")
;;//! \htmlinclude Tool.msg.html


(defclass svaya_control::Tool
  :super ros::object
  :slots (_tool_cnt _tool_position_x _tool_position_y _tool_position_z _tool_radius _cone_orient_x _cone_orient_y _cone_orient_z _tool_direction_feat _solid_angle _pan_angle _tilt_angle ))

(defmethod svaya_control::Tool
  (:init
   (&key
    ((:tool_cnt __tool_cnt) 0)
    ((:tool_position_x __tool_position_x) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:tool_position_y __tool_position_y) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:tool_position_z __tool_position_z) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:tool_radius __tool_radius) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:cone_orient_x __cone_orient_x) 0.0)
    ((:cone_orient_y __cone_orient_y) 0.0)
    ((:cone_orient_z __cone_orient_z) 0.0)
    ((:tool_direction_feat __tool_direction_feat) 0.0)
    ((:solid_angle __solid_angle) 0.0)
    ((:pan_angle __pan_angle) 0.0)
    ((:tilt_angle __tilt_angle) 0.0)
    )
   (send-super :init)
   (setq _tool_cnt (round __tool_cnt))
   (setq _tool_position_x __tool_position_x)
   (setq _tool_position_y __tool_position_y)
   (setq _tool_position_z __tool_position_z)
   (setq _tool_radius __tool_radius)
   (setq _cone_orient_x (float __cone_orient_x))
   (setq _cone_orient_y (float __cone_orient_y))
   (setq _cone_orient_z (float __cone_orient_z))
   (setq _tool_direction_feat (float __tool_direction_feat))
   (setq _solid_angle (float __solid_angle))
   (setq _pan_angle (float __pan_angle))
   (setq _tilt_angle (float __tilt_angle))
   self)
  (:tool_cnt
   (&optional __tool_cnt)
   (if __tool_cnt (setq _tool_cnt __tool_cnt)) _tool_cnt)
  (:tool_position_x
   (&optional __tool_position_x)
   (if __tool_position_x (setq _tool_position_x __tool_position_x)) _tool_position_x)
  (:tool_position_y
   (&optional __tool_position_y)
   (if __tool_position_y (setq _tool_position_y __tool_position_y)) _tool_position_y)
  (:tool_position_z
   (&optional __tool_position_z)
   (if __tool_position_z (setq _tool_position_z __tool_position_z)) _tool_position_z)
  (:tool_radius
   (&optional __tool_radius)
   (if __tool_radius (setq _tool_radius __tool_radius)) _tool_radius)
  (:cone_orient_x
   (&optional __cone_orient_x)
   (if __cone_orient_x (setq _cone_orient_x __cone_orient_x)) _cone_orient_x)
  (:cone_orient_y
   (&optional __cone_orient_y)
   (if __cone_orient_y (setq _cone_orient_y __cone_orient_y)) _cone_orient_y)
  (:cone_orient_z
   (&optional __cone_orient_z)
   (if __cone_orient_z (setq _cone_orient_z __cone_orient_z)) _cone_orient_z)
  (:tool_direction_feat
   (&optional __tool_direction_feat)
   (if __tool_direction_feat (setq _tool_direction_feat __tool_direction_feat)) _tool_direction_feat)
  (:solid_angle
   (&optional __solid_angle)
   (if __solid_angle (setq _solid_angle __solid_angle)) _solid_angle)
  (:pan_angle
   (&optional __pan_angle)
   (if __pan_angle (setq _pan_angle __pan_angle)) _pan_angle)
  (:tilt_angle
   (&optional __tilt_angle)
   (if __tilt_angle (setq _tilt_angle __tilt_angle)) _tilt_angle)
  (:serialization-length
   ()
   (+
    ;; uint8 _tool_cnt
    1
    ;; float64[] _tool_position_x
    (* 8    (length _tool_position_x)) 4
    ;; float64[] _tool_position_y
    (* 8    (length _tool_position_y)) 4
    ;; float64[] _tool_position_z
    (* 8    (length _tool_position_z)) 4
    ;; float64[] _tool_radius
    (* 8    (length _tool_radius)) 4
    ;; float64 _cone_orient_x
    8
    ;; float64 _cone_orient_y
    8
    ;; float64 _cone_orient_z
    8
    ;; float64 _tool_direction_feat
    8
    ;; float64 _solid_angle
    8
    ;; float64 _pan_angle
    8
    ;; float64 _tilt_angle
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _tool_cnt
       (write-byte _tool_cnt s)
     ;; float64[] _tool_position_x
     (write-long (length _tool_position_x) s)
     (dotimes (i (length _tool_position_x))
       (sys::poke (elt _tool_position_x i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _tool_position_y
     (write-long (length _tool_position_y) s)
     (dotimes (i (length _tool_position_y))
       (sys::poke (elt _tool_position_y i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _tool_position_z
     (write-long (length _tool_position_z) s)
     (dotimes (i (length _tool_position_z))
       (sys::poke (elt _tool_position_z i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _tool_radius
     (write-long (length _tool_radius) s)
     (dotimes (i (length _tool_radius))
       (sys::poke (elt _tool_radius i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _cone_orient_x
       (sys::poke _cone_orient_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _cone_orient_y
       (sys::poke _cone_orient_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _cone_orient_z
       (sys::poke _cone_orient_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _tool_direction_feat
       (sys::poke _tool_direction_feat (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _solid_angle
       (sys::poke _solid_angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pan_angle
       (sys::poke _pan_angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _tilt_angle
       (sys::poke _tilt_angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _tool_cnt
     (setq _tool_cnt (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64[] _tool_position_x
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _tool_position_x (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _tool_position_x i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _tool_position_y
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _tool_position_y (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _tool_position_y i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _tool_position_z
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _tool_position_z (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _tool_position_z i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _tool_radius
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _tool_radius (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _tool_radius i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64 _cone_orient_x
     (setq _cone_orient_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _cone_orient_y
     (setq _cone_orient_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _cone_orient_z
     (setq _cone_orient_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _tool_direction_feat
     (setq _tool_direction_feat (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _solid_angle
     (setq _solid_angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pan_angle
     (setq _pan_angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _tilt_angle
     (setq _tilt_angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get svaya_control::Tool :md5sum-) "3ee97d849631d40fd56f1eb1fec29f41")
(setf (get svaya_control::Tool :datatype-) "svaya_control/Tool")
(setf (get svaya_control::Tool :definition-)
      "uint8 tool_cnt
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



(provide :svaya_control/Tool "3ee97d849631d40fd56f1eb1fec29f41")


