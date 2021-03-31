
(cl:in-package :asdf)

(defsystem "svaya_control-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "JointLimit" :depends-on ("_package_JointLimit"))
    (:file "_package_JointLimit" :depends-on ("_package"))
    (:file "SafetyData" :depends-on ("_package_SafetyData"))
    (:file "_package_SafetyData" :depends-on ("_package"))
    (:file "SafetyDataArr" :depends-on ("_package_SafetyDataArr"))
    (:file "_package_SafetyDataArr" :depends-on ("_package"))
    (:file "SafetyError" :depends-on ("_package_SafetyError"))
    (:file "_package_SafetyError" :depends-on ("_package"))
    (:file "SafetyErrorArr" :depends-on ("_package_SafetyErrorArr"))
    (:file "_package_SafetyErrorArr" :depends-on ("_package"))
    (:file "SafetyPlane" :depends-on ("_package_SafetyPlane"))
    (:file "_package_SafetyPlane" :depends-on ("_package"))
    (:file "Tool" :depends-on ("_package_Tool"))
    (:file "_package_Tool" :depends-on ("_package"))
    (:file "master_id" :depends-on ("_package_master_id"))
    (:file "_package_master_id" :depends-on ("_package"))
  ))