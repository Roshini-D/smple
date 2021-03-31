;; Auto-generated. Do not edit!


(when (boundp 'svaya_control::JointLimit)
  (if (not (find-package "SVAYA_CONTROL"))
    (make-package "SVAYA_CONTROL"))
  (shadow 'JointLimit (find-package "SVAYA_CONTROL")))
(unless (find-package "SVAYA_CONTROL::JOINTLIMIT")
  (make-package "SVAYA_CONTROL::JOINTLIMIT"))

(in-package "ROS")
;;//! \htmlinclude JointLimit.msg.html


(defclass svaya_control::JointLimit
  :super ros::object
  :slots (_joint_cnt _joint_max_pos_limit_normal_mode _joint_min_pos_limit_normal_mode _joint_max_pos_limit_reduced_mode _joint_min_pos_limit_reduced_mode _joint_vel_limit_reduced_mode _joint_vel_limit_normal_mode ))

(defmethod svaya_control::JointLimit
  (:init
   (&key
    ((:joint_cnt __joint_cnt) 0)
    ((:joint_max_pos_limit_normal_mode __joint_max_pos_limit_normal_mode) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:joint_min_pos_limit_normal_mode __joint_min_pos_limit_normal_mode) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:joint_max_pos_limit_reduced_mode __joint_max_pos_limit_reduced_mode) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:joint_min_pos_limit_reduced_mode __joint_min_pos_limit_reduced_mode) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:joint_vel_limit_reduced_mode __joint_vel_limit_reduced_mode) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:joint_vel_limit_normal_mode __joint_vel_limit_normal_mode) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _joint_cnt (round __joint_cnt))
   (setq _joint_max_pos_limit_normal_mode __joint_max_pos_limit_normal_mode)
   (setq _joint_min_pos_limit_normal_mode __joint_min_pos_limit_normal_mode)
   (setq _joint_max_pos_limit_reduced_mode __joint_max_pos_limit_reduced_mode)
   (setq _joint_min_pos_limit_reduced_mode __joint_min_pos_limit_reduced_mode)
   (setq _joint_vel_limit_reduced_mode __joint_vel_limit_reduced_mode)
   (setq _joint_vel_limit_normal_mode __joint_vel_limit_normal_mode)
   self)
  (:joint_cnt
   (&optional __joint_cnt)
   (if __joint_cnt (setq _joint_cnt __joint_cnt)) _joint_cnt)
  (:joint_max_pos_limit_normal_mode
   (&optional __joint_max_pos_limit_normal_mode)
   (if __joint_max_pos_limit_normal_mode (setq _joint_max_pos_limit_normal_mode __joint_max_pos_limit_normal_mode)) _joint_max_pos_limit_normal_mode)
  (:joint_min_pos_limit_normal_mode
   (&optional __joint_min_pos_limit_normal_mode)
   (if __joint_min_pos_limit_normal_mode (setq _joint_min_pos_limit_normal_mode __joint_min_pos_limit_normal_mode)) _joint_min_pos_limit_normal_mode)
  (:joint_max_pos_limit_reduced_mode
   (&optional __joint_max_pos_limit_reduced_mode)
   (if __joint_max_pos_limit_reduced_mode (setq _joint_max_pos_limit_reduced_mode __joint_max_pos_limit_reduced_mode)) _joint_max_pos_limit_reduced_mode)
  (:joint_min_pos_limit_reduced_mode
   (&optional __joint_min_pos_limit_reduced_mode)
   (if __joint_min_pos_limit_reduced_mode (setq _joint_min_pos_limit_reduced_mode __joint_min_pos_limit_reduced_mode)) _joint_min_pos_limit_reduced_mode)
  (:joint_vel_limit_reduced_mode
   (&optional __joint_vel_limit_reduced_mode)
   (if __joint_vel_limit_reduced_mode (setq _joint_vel_limit_reduced_mode __joint_vel_limit_reduced_mode)) _joint_vel_limit_reduced_mode)
  (:joint_vel_limit_normal_mode
   (&optional __joint_vel_limit_normal_mode)
   (if __joint_vel_limit_normal_mode (setq _joint_vel_limit_normal_mode __joint_vel_limit_normal_mode)) _joint_vel_limit_normal_mode)
  (:serialization-length
   ()
   (+
    ;; uint8 _joint_cnt
    1
    ;; float64[] _joint_max_pos_limit_normal_mode
    (* 8    (length _joint_max_pos_limit_normal_mode)) 4
    ;; float64[] _joint_min_pos_limit_normal_mode
    (* 8    (length _joint_min_pos_limit_normal_mode)) 4
    ;; float64[] _joint_max_pos_limit_reduced_mode
    (* 8    (length _joint_max_pos_limit_reduced_mode)) 4
    ;; float64[] _joint_min_pos_limit_reduced_mode
    (* 8    (length _joint_min_pos_limit_reduced_mode)) 4
    ;; float64[] _joint_vel_limit_reduced_mode
    (* 8    (length _joint_vel_limit_reduced_mode)) 4
    ;; float64[] _joint_vel_limit_normal_mode
    (* 8    (length _joint_vel_limit_normal_mode)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _joint_cnt
       (write-byte _joint_cnt s)
     ;; float64[] _joint_max_pos_limit_normal_mode
     (write-long (length _joint_max_pos_limit_normal_mode) s)
     (dotimes (i (length _joint_max_pos_limit_normal_mode))
       (sys::poke (elt _joint_max_pos_limit_normal_mode i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _joint_min_pos_limit_normal_mode
     (write-long (length _joint_min_pos_limit_normal_mode) s)
     (dotimes (i (length _joint_min_pos_limit_normal_mode))
       (sys::poke (elt _joint_min_pos_limit_normal_mode i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _joint_max_pos_limit_reduced_mode
     (write-long (length _joint_max_pos_limit_reduced_mode) s)
     (dotimes (i (length _joint_max_pos_limit_reduced_mode))
       (sys::poke (elt _joint_max_pos_limit_reduced_mode i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _joint_min_pos_limit_reduced_mode
     (write-long (length _joint_min_pos_limit_reduced_mode) s)
     (dotimes (i (length _joint_min_pos_limit_reduced_mode))
       (sys::poke (elt _joint_min_pos_limit_reduced_mode i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _joint_vel_limit_reduced_mode
     (write-long (length _joint_vel_limit_reduced_mode) s)
     (dotimes (i (length _joint_vel_limit_reduced_mode))
       (sys::poke (elt _joint_vel_limit_reduced_mode i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _joint_vel_limit_normal_mode
     (write-long (length _joint_vel_limit_normal_mode) s)
     (dotimes (i (length _joint_vel_limit_normal_mode))
       (sys::poke (elt _joint_vel_limit_normal_mode i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _joint_cnt
     (setq _joint_cnt (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64[] _joint_max_pos_limit_normal_mode
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_max_pos_limit_normal_mode (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _joint_max_pos_limit_normal_mode i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _joint_min_pos_limit_normal_mode
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_min_pos_limit_normal_mode (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _joint_min_pos_limit_normal_mode i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _joint_max_pos_limit_reduced_mode
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_max_pos_limit_reduced_mode (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _joint_max_pos_limit_reduced_mode i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _joint_min_pos_limit_reduced_mode
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_min_pos_limit_reduced_mode (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _joint_min_pos_limit_reduced_mode i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _joint_vel_limit_reduced_mode
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_vel_limit_reduced_mode (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _joint_vel_limit_reduced_mode i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _joint_vel_limit_normal_mode
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_vel_limit_normal_mode (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _joint_vel_limit_normal_mode i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get svaya_control::JointLimit :md5sum-) "5401a4925cdae95fe53c373fe45e169d")
(setf (get svaya_control::JointLimit :datatype-) "svaya_control/JointLimit")
(setf (get svaya_control::JointLimit :definition-)
      "uint8 joint_cnt
float64[] joint_max_pos_limit_normal_mode
float64[] joint_min_pos_limit_normal_mode
float64[] joint_max_pos_limit_reduced_mode
float64[] joint_min_pos_limit_reduced_mode
float64[] joint_vel_limit_reduced_mode
float64[] joint_vel_limit_normal_mode


")



(provide :svaya_control/JointLimit "5401a4925cdae95fe53c373fe45e169d")


