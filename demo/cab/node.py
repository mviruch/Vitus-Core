import rospy
from std_msgs.msg import Header
from sensor_msgs.msg import Image
import cv2
import numpy as np

rospy.init_node('v')
r = rospy.Rate(30)
cat = cv2.VideoCapture(0)
cat.set(cv2.CAP_PROP_FRAME_HEIGHT, 240)
cat.set(cv2.CAP_PROP_FRAME_WIDTH, 640)

l = rospy.Publisher('/camera/left/image_raw', Image, queue_size=1)
r = rospy.Publisher('/camera/right/image_raw', Image, queue_size=1)

while not rospy.is_shutdown():
    ret, frame = cat.read()
    cv2.imshow('frame', frame)
    cv2.waitKey(1)
    imgL = frame[:, :320]
    imgR = frame[:, 320:]
    header = Header(stamp=rospy.Time.now())
    header.frame_id = 'map'
    img = Image()
    img.height = 240
    img.width = 320
    img.encoding = 'rgb8'
    img.step = 320*3
    img.header = header
    img.data = imgL.tostring()
    l.publish(img)
    img.data = imgR.tostring()
    r.publish(img)
