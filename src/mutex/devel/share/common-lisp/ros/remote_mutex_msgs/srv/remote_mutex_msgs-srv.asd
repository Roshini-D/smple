
(cl:in-package :asdf)

(defsystem "remote_mutex_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "mutexSrv" :depends-on ("_package_mutexSrv"))
    (:file "_package_mutexSrv" :depends-on ("_package"))
  ))