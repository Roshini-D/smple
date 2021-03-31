;; Auto-generated. Do not edit!


(when (boundp 'remote_mutex_msgs::mutexSrv)
  (if (not (find-package "REMOTE_MUTEX_MSGS"))
    (make-package "REMOTE_MUTEX_MSGS"))
  (shadow 'mutexSrv (find-package "REMOTE_MUTEX_MSGS")))
(unless (find-package "REMOTE_MUTEX_MSGS::MUTEXSRV")
  (make-package "REMOTE_MUTEX_MSGS::MUTEXSRV"))
(unless (find-package "REMOTE_MUTEX_MSGS::MUTEXSRVREQUEST")
  (make-package "REMOTE_MUTEX_MSGS::MUTEXSRVREQUEST"))
(unless (find-package "REMOTE_MUTEX_MSGS::MUTEXSRVRESPONSE")
  (make-package "REMOTE_MUTEX_MSGS::MUTEXSRVRESPONSE"))

(in-package "ROS")





(intern "*TYPE_LOCK*" (find-package "REMOTE_MUTEX_MSGS::MUTEXSRVREQUEST"))
(shadow '*TYPE_LOCK* (find-package "REMOTE_MUTEX_MSGS::MUTEXSRVREQUEST"))
(defconstant remote_mutex_msgs::mutexSrvRequest::*TYPE_LOCK* 1)
(intern "*TYPE_UNLOCK*" (find-package "REMOTE_MUTEX_MSGS::MUTEXSRVREQUEST"))
(shadow '*TYPE_UNLOCK* (find-package "REMOTE_MUTEX_MSGS::MUTEXSRVREQUEST"))
(defconstant remote_mutex_msgs::mutexSrvRequest::*TYPE_UNLOCK* 2)
(intern "*TYPE_POLL*" (find-package "REMOTE_MUTEX_MSGS::MUTEXSRVREQUEST"))
(shadow '*TYPE_POLL* (find-package "REMOTE_MUTEX_MSGS::MUTEXSRVREQUEST"))
(defconstant remote_mutex_msgs::mutexSrvRequest::*TYPE_POLL* 3)
(defclass remote_mutex_msgs::mutexSrvRequest
  :super ros::object
  :slots (_requestor _requestType ))

(defmethod remote_mutex_msgs::mutexSrvRequest
  (:init
   (&key
    ((:requestor __requestor) "")
    ((:requestType __requestType) 0)
    )
   (send-super :init)
   (setq _requestor (string __requestor))
   (setq _requestType (round __requestType))
   self)
  (:requestor
   (&optional __requestor)
   (if __requestor (setq _requestor __requestor)) _requestor)
  (:requestType
   (&optional __requestType)
   (if __requestType (setq _requestType __requestType)) _requestType)
  (:serialization-length
   ()
   (+
    ;; string _requestor
    4 (length _requestor)
    ;; uint8 _requestType
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _requestor
       (write-long (length _requestor) s) (princ _requestor s)
     ;; uint8 _requestType
       (write-byte _requestType s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _requestor
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _requestor (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _requestType
     (setq _requestType (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(intern "*STATUS_LOCKED*" (find-package "REMOTE_MUTEX_MSGS::MUTEXSRVRESPONSE"))
(shadow '*STATUS_LOCKED* (find-package "REMOTE_MUTEX_MSGS::MUTEXSRVRESPONSE"))
(defconstant remote_mutex_msgs::mutexSrvResponse::*STATUS_LOCKED* 1)
(intern "*STATUS_UNLOCKED*" (find-package "REMOTE_MUTEX_MSGS::MUTEXSRVRESPONSE"))
(shadow '*STATUS_UNLOCKED* (find-package "REMOTE_MUTEX_MSGS::MUTEXSRVRESPONSE"))
(defconstant remote_mutex_msgs::mutexSrvResponse::*STATUS_UNLOCKED* 0)
(defclass remote_mutex_msgs::mutexSrvResponse
  :super ros::object
  :slots (_status ))

(defmethod remote_mutex_msgs::mutexSrvResponse
  (:init
   (&key
    ((:status __status) 0)
    )
   (send-super :init)
   (setq _status (round __status))
   self)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; uint8 _status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _status
       (write-byte _status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _status
     (setq _status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass remote_mutex_msgs::mutexSrv
  :super ros::object
  :slots ())

(setf (get remote_mutex_msgs::mutexSrv :md5sum-) "76380b12c62c62b1c75ef04892016d2b")
(setf (get remote_mutex_msgs::mutexSrv :datatype-) "remote_mutex_msgs/mutexSrv")
(setf (get remote_mutex_msgs::mutexSrv :request) remote_mutex_msgs::mutexSrvRequest)
(setf (get remote_mutex_msgs::mutexSrv :response) remote_mutex_msgs::mutexSrvResponse)

(defmethod remote_mutex_msgs::mutexSrvRequest
  (:response () (instance remote_mutex_msgs::mutexSrvResponse :init)))

(setf (get remote_mutex_msgs::mutexSrvRequest :md5sum-) "76380b12c62c62b1c75ef04892016d2b")
(setf (get remote_mutex_msgs::mutexSrvRequest :datatype-) "remote_mutex_msgs/mutexSrvRequest")
(setf (get remote_mutex_msgs::mutexSrvRequest :definition-)
      "string requestor
uint8 requestType
uint8 TYPE_LOCK = 1
uint8 TYPE_UNLOCK = 2
uint8 TYPE_POLL = 3
---
uint8 status
uint8 STATUS_LOCKED = 1
uint8 STATUS_UNLOCKED = 0 

")

(setf (get remote_mutex_msgs::mutexSrvResponse :md5sum-) "76380b12c62c62b1c75ef04892016d2b")
(setf (get remote_mutex_msgs::mutexSrvResponse :datatype-) "remote_mutex_msgs/mutexSrvResponse")
(setf (get remote_mutex_msgs::mutexSrvResponse :definition-)
      "string requestor
uint8 requestType
uint8 TYPE_LOCK = 1
uint8 TYPE_UNLOCK = 2
uint8 TYPE_POLL = 3
---
uint8 status
uint8 STATUS_LOCKED = 1
uint8 STATUS_UNLOCKED = 0 

")



(provide :remote_mutex_msgs/mutexSrv "76380b12c62c62b1c75ef04892016d2b")


