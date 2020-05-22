
(cl:in-package :asdf)

(defsystem "ORB_SLAM2-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "keyPointPCLs" :depends-on ("_package_keyPointPCLs"))
    (:file "_package_keyPointPCLs" :depends-on ("_package"))
  ))