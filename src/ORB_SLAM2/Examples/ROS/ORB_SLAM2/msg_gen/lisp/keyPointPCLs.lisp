; Auto-generated. Do not edit!


(cl:in-package ORB_SLAM2-msg)


;//! \htmlinclude keyPointPCLs.msg.html

(cl:defclass <keyPointPCLs> (roslisp-msg-protocol:ros-message)
  ((size
    :reader size
    :initarg :size
    :type cl:integer
    :initform 0)
   (ptX
    :reader ptX
    :initarg :ptX
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (ptY
    :reader ptY
    :initarg :ptY
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (rightY
    :reader rightY
    :initarg :rightY
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (mDepth
    :reader mDepth
    :initarg :mDepth
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass keyPointPCLs (<keyPointPCLs>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <keyPointPCLs>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'keyPointPCLs)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ORB_SLAM2-msg:<keyPointPCLs> is deprecated: use ORB_SLAM2-msg:keyPointPCLs instead.")))

(cl:ensure-generic-function 'size-val :lambda-list '(m))
(cl:defmethod size-val ((m <keyPointPCLs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ORB_SLAM2-msg:size-val is deprecated.  Use ORB_SLAM2-msg:size instead.")
  (size m))

(cl:ensure-generic-function 'ptX-val :lambda-list '(m))
(cl:defmethod ptX-val ((m <keyPointPCLs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ORB_SLAM2-msg:ptX-val is deprecated.  Use ORB_SLAM2-msg:ptX instead.")
  (ptX m))

(cl:ensure-generic-function 'ptY-val :lambda-list '(m))
(cl:defmethod ptY-val ((m <keyPointPCLs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ORB_SLAM2-msg:ptY-val is deprecated.  Use ORB_SLAM2-msg:ptY instead.")
  (ptY m))

(cl:ensure-generic-function 'rightY-val :lambda-list '(m))
(cl:defmethod rightY-val ((m <keyPointPCLs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ORB_SLAM2-msg:rightY-val is deprecated.  Use ORB_SLAM2-msg:rightY instead.")
  (rightY m))

(cl:ensure-generic-function 'mDepth-val :lambda-list '(m))
(cl:defmethod mDepth-val ((m <keyPointPCLs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ORB_SLAM2-msg:mDepth-val is deprecated.  Use ORB_SLAM2-msg:mDepth instead.")
  (mDepth m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <keyPointPCLs>) ostream)
  "Serializes a message object of type '<keyPointPCLs>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'size)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ptX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'ptX))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ptY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'ptY))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'rightY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'rightY))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'mDepth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'mDepth))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <keyPointPCLs>) istream)
  "Deserializes a message object of type '<keyPointPCLs>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'size)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ptX) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ptX)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ptY) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ptY)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'rightY) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'rightY)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'mDepth) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'mDepth)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<keyPointPCLs>)))
  "Returns string type for a message object of type '<keyPointPCLs>"
  "ORB_SLAM2/keyPointPCLs")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'keyPointPCLs)))
  "Returns string type for a message object of type 'keyPointPCLs"
  "ORB_SLAM2/keyPointPCLs")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<keyPointPCLs>)))
  "Returns md5sum for a message object of type '<keyPointPCLs>"
  "6ead73404bcb61395bff533d321119c5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'keyPointPCLs)))
  "Returns md5sum for a message object of type 'keyPointPCLs"
  "6ead73404bcb61395bff533d321119c5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<keyPointPCLs>)))
  "Returns full string definition for message of type '<keyPointPCLs>"
  (cl:format cl:nil "uint32 size~%float32[] ptX~%float32[] ptY~%float32[] rightY~%float32[] mDepth~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'keyPointPCLs)))
  "Returns full string definition for message of type 'keyPointPCLs"
  (cl:format cl:nil "uint32 size~%float32[] ptX~%float32[] ptY~%float32[] rightY~%float32[] mDepth~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <keyPointPCLs>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ptX) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ptY) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'rightY) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'mDepth) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <keyPointPCLs>))
  "Converts a ROS message object to a list"
  (cl:list 'keyPointPCLs
    (cl:cons ':size (size msg))
    (cl:cons ':ptX (ptX msg))
    (cl:cons ':ptY (ptY msg))
    (cl:cons ':rightY (rightY msg))
    (cl:cons ':mDepth (mDepth msg))
))
