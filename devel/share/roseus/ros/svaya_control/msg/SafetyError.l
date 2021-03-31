;; Auto-generated. Do not edit!


(when (boundp 'svaya_control::SafetyError)
  (if (not (find-package "SVAYA_CONTROL"))
    (make-package "SVAYA_CONTROL"))
  (shadow 'SafetyError (find-package "SVAYA_CONTROL")))
(unless (find-package "SVAYA_CONTROL::SAFETYERROR")
  (make-package "SVAYA_CONTROL::SAFETYERROR"))

(in-package "ROS")
;;//! \htmlinclude SafetyError.msg.html


(defclass svaya_control::SafetyError
  :super ros::object
  :slots (_error_list _mode_of_operation _recovery_mode_flag _safety_limits_flag _status ))

(defmethod svaya_control::SafetyError
  (:init
   (&key
    ((:error_list __error_list) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:mode_of_operation __mode_of_operation) nil)
    ((:recovery_mode_flag __recovery_mode_flag) nil)
    ((:safety_limits_flag __safety_limits_flag) nil)
    ((:status __status) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _error_list __error_list)
   (setq _mode_of_operation __mode_of_operation)
   (setq _recovery_mode_flag __recovery_mode_flag)
   (setq _safety_limits_flag __safety_limits_flag)
   (setq _status __status)
   self)
  (:error_list
   (&optional __error_list)
   (if __error_list (setq _error_list __error_list)) _error_list)
  (:mode_of_operation
   (&optional __mode_of_operation)
   (if __mode_of_operation (setq _mode_of_operation __mode_of_operation)) _mode_of_operation)
  (:recovery_mode_flag
   (&optional __recovery_mode_flag)
   (if __recovery_mode_flag (setq _recovery_mode_flag __recovery_mode_flag)) _recovery_mode_flag)
  (:safety_limits_flag
   (&optional __safety_limits_flag)
   (if __safety_limits_flag (setq _safety_limits_flag __safety_limits_flag)) _safety_limits_flag)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; float64[] _error_list
    (* 8    (length _error_list)) 4
    ;; bool _mode_of_operation
    1
    ;; bool _recovery_mode_flag
    1
    ;; bool _safety_limits_flag
    1
    ;; int32[] _status
    (* 4    (length _status)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _error_list
     (write-long (length _error_list) s)
     (dotimes (i (length _error_list))
       (sys::poke (elt _error_list i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; bool _mode_of_operation
       (if _mode_of_operation (write-byte -1 s) (write-byte 0 s))
     ;; bool _recovery_mode_flag
       (if _recovery_mode_flag (write-byte -1 s) (write-byte 0 s))
     ;; bool _safety_limits_flag
       (if _safety_limits_flag (write-byte -1 s) (write-byte 0 s))
     ;; int32[] _status
     (write-long (length _status) s)
     (dotimes (i (length _status))
       (write-long (elt _status i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _error_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _error_list (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _error_list i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; bool _mode_of_operation
     (setq _mode_of_operation (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _recovery_mode_flag
     (setq _recovery_mode_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _safety_limits_flag
     (setq _safety_limits_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int32[] _status
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _status (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _status i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get svaya_control::SafetyError :md5sum-) "effb15012df92429b21d6d9d6f7df6c3")
(setf (get svaya_control::SafetyError :datatype-) "svaya_control/SafetyError")
(setf (get svaya_control::SafetyError :definition-)
      "float64[] error_list
bool mode_of_operation
bool recovery_mode_flag
bool safety_limits_flag
int32[] status

")



(provide :svaya_control/SafetyError "effb15012df92429b21d6d9d6f7df6c3")


