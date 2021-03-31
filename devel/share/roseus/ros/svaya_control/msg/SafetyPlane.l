;; Auto-generated. Do not edit!


(when (boundp 'svaya_control::SafetyPlane)
  (if (not (find-package "SVAYA_CONTROL"))
    (make-package "SVAYA_CONTROL"))
  (shadow 'SafetyPlane (find-package "SVAYA_CONTROL")))
(unless (find-package "SVAYA_CONTROL::SAFETYPLANE")
  (make-package "SVAYA_CONTROL::SAFETYPLANE"))

(in-package "ROS")
;;//! \htmlinclude SafetyPlane.msg.html


(defclass svaya_control::SafetyPlane
  :super ros::object
  :slots (_plane_cnt _plane_origin_x _plane_origin_y _plane_origin_z _normal_dir_x _normal_dir_y _normal_dir_z _safety_feat _elbow_restrict ))

(defmethod svaya_control::SafetyPlane
  (:init
   (&key
    ((:plane_cnt __plane_cnt) 0)
    ((:plane_origin_x __plane_origin_x) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:plane_origin_y __plane_origin_y) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:plane_origin_z __plane_origin_z) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:normal_dir_x __normal_dir_x) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:normal_dir_y __normal_dir_y) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:normal_dir_z __normal_dir_z) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:safety_feat __safety_feat) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:elbow_restrict __elbow_restrict) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _plane_cnt (round __plane_cnt))
   (setq _plane_origin_x __plane_origin_x)
   (setq _plane_origin_y __plane_origin_y)
   (setq _plane_origin_z __plane_origin_z)
   (setq _normal_dir_x __normal_dir_x)
   (setq _normal_dir_y __normal_dir_y)
   (setq _normal_dir_z __normal_dir_z)
   (setq _safety_feat __safety_feat)
   (setq _elbow_restrict __elbow_restrict)
   self)
  (:plane_cnt
   (&optional __plane_cnt)
   (if __plane_cnt (setq _plane_cnt __plane_cnt)) _plane_cnt)
  (:plane_origin_x
   (&optional __plane_origin_x)
   (if __plane_origin_x (setq _plane_origin_x __plane_origin_x)) _plane_origin_x)
  (:plane_origin_y
   (&optional __plane_origin_y)
   (if __plane_origin_y (setq _plane_origin_y __plane_origin_y)) _plane_origin_y)
  (:plane_origin_z
   (&optional __plane_origin_z)
   (if __plane_origin_z (setq _plane_origin_z __plane_origin_z)) _plane_origin_z)
  (:normal_dir_x
   (&optional __normal_dir_x)
   (if __normal_dir_x (setq _normal_dir_x __normal_dir_x)) _normal_dir_x)
  (:normal_dir_y
   (&optional __normal_dir_y)
   (if __normal_dir_y (setq _normal_dir_y __normal_dir_y)) _normal_dir_y)
  (:normal_dir_z
   (&optional __normal_dir_z)
   (if __normal_dir_z (setq _normal_dir_z __normal_dir_z)) _normal_dir_z)
  (:safety_feat
   (&optional __safety_feat)
   (if __safety_feat (setq _safety_feat __safety_feat)) _safety_feat)
  (:elbow_restrict
   (&optional __elbow_restrict)
   (if __elbow_restrict (setq _elbow_restrict __elbow_restrict)) _elbow_restrict)
  (:serialization-length
   ()
   (+
    ;; uint8 _plane_cnt
    1
    ;; float64[] _plane_origin_x
    (* 8    (length _plane_origin_x)) 4
    ;; float64[] _plane_origin_y
    (* 8    (length _plane_origin_y)) 4
    ;; float64[] _plane_origin_z
    (* 8    (length _plane_origin_z)) 4
    ;; float64[] _normal_dir_x
    (* 8    (length _normal_dir_x)) 4
    ;; float64[] _normal_dir_y
    (* 8    (length _normal_dir_y)) 4
    ;; float64[] _normal_dir_z
    (* 8    (length _normal_dir_z)) 4
    ;; float64[] _safety_feat
    (* 8    (length _safety_feat)) 4
    ;; float64[] _elbow_restrict
    (* 8    (length _elbow_restrict)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _plane_cnt
       (write-byte _plane_cnt s)
     ;; float64[] _plane_origin_x
     (write-long (length _plane_origin_x) s)
     (dotimes (i (length _plane_origin_x))
       (sys::poke (elt _plane_origin_x i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _plane_origin_y
     (write-long (length _plane_origin_y) s)
     (dotimes (i (length _plane_origin_y))
       (sys::poke (elt _plane_origin_y i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _plane_origin_z
     (write-long (length _plane_origin_z) s)
     (dotimes (i (length _plane_origin_z))
       (sys::poke (elt _plane_origin_z i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _normal_dir_x
     (write-long (length _normal_dir_x) s)
     (dotimes (i (length _normal_dir_x))
       (sys::poke (elt _normal_dir_x i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _normal_dir_y
     (write-long (length _normal_dir_y) s)
     (dotimes (i (length _normal_dir_y))
       (sys::poke (elt _normal_dir_y i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _normal_dir_z
     (write-long (length _normal_dir_z) s)
     (dotimes (i (length _normal_dir_z))
       (sys::poke (elt _normal_dir_z i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _safety_feat
     (write-long (length _safety_feat) s)
     (dotimes (i (length _safety_feat))
       (sys::poke (elt _safety_feat i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _elbow_restrict
     (write-long (length _elbow_restrict) s)
     (dotimes (i (length _elbow_restrict))
       (sys::poke (elt _elbow_restrict i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _plane_cnt
     (setq _plane_cnt (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64[] _plane_origin_x
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _plane_origin_x (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _plane_origin_x i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _plane_origin_y
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _plane_origin_y (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _plane_origin_y i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _plane_origin_z
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _plane_origin_z (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _plane_origin_z i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _normal_dir_x
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _normal_dir_x (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _normal_dir_x i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _normal_dir_y
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _normal_dir_y (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _normal_dir_y i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _normal_dir_z
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _normal_dir_z (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _normal_dir_z i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _safety_feat
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _safety_feat (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _safety_feat i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _elbow_restrict
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _elbow_restrict (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _elbow_restrict i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get svaya_control::SafetyPlane :md5sum-) "660c688686d98eb493ccc943cb987589")
(setf (get svaya_control::SafetyPlane :datatype-) "svaya_control/SafetyPlane")
(setf (get svaya_control::SafetyPlane :definition-)
      "uint8 plane_cnt
float64[]  plane_origin_x
float64[]  plane_origin_y
float64[]  plane_origin_z

float64[]  normal_dir_x
float64[]  normal_dir_y
float64[]  normal_dir_z

float64[]  safety_feat
float64[]  elbow_restrict

")



(provide :svaya_control/SafetyPlane "660c688686d98eb493ccc943cb987589")


