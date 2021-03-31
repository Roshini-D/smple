;; Auto-generated. Do not edit!


(when (boundp 'svaya_control::SafetyErrorArr)
  (if (not (find-package "SVAYA_CONTROL"))
    (make-package "SVAYA_CONTROL"))
  (shadow 'SafetyErrorArr (find-package "SVAYA_CONTROL")))
(unless (find-package "SVAYA_CONTROL::SAFETYERRORARR")
  (make-package "SVAYA_CONTROL::SAFETYERRORARR"))

(in-package "ROS")
;;//! \htmlinclude SafetyErrorArr.msg.html


(defclass svaya_control::SafetyErrorArr
  :super ros::object
  :slots (_msgdata ))

(defmethod svaya_control::SafetyErrorArr
  (:init
   (&key
    ((:msgdata __msgdata) (let (r) (dotimes (i 0) (push (instance svaya_control::SafetyError :init) r)) r))
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
    ;; svaya_control/SafetyError[] _msgdata
    (apply #'+ (send-all _msgdata :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; svaya_control/SafetyError[] _msgdata
     (write-long (length _msgdata) s)
     (dolist (elem _msgdata)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; svaya_control/SafetyError[] _msgdata
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _msgdata (let (r) (dotimes (i n) (push (instance svaya_control::SafetyError :init) r)) r))
     (dolist (elem- _msgdata)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get svaya_control::SafetyErrorArr :md5sum-) "dee21b917a60d8be2263a10f8e5c4054")
(setf (get svaya_control::SafetyErrorArr :datatype-) "svaya_control/SafetyErrorArr")
(setf (get svaya_control::SafetyErrorArr :definition-)
      "SafetyError[] msgdata

================================================================================
MSG: svaya_control/SafetyError
float64[] error_list
bool mode_of_operation
bool recovery_mode_flag
bool safety_limits_flag
int32[] status

")



(provide :svaya_control/SafetyErrorArr "dee21b917a60d8be2263a10f8e5c4054")


