#!/usr/bin/env python

import rospy
from std_msgs.msg import Header
from sensor_msgs.msg import Image
import cv2
import numpy as np

# global settings
rate = 10 # 10hz
devNum = 1 # ls /dev/video*
           # lsusb

# init global var
# rospy.init_node('voicer', anonymous=True)
# right & left ros topic publisher
lPuber = rospy.Publisher('/camera/left/image_raw', Image, queue_size=1)
rPuber = rospy.Publisher('/camera/right/image_raw', Image, queue_size=1)

# init ros topic
image_tmp = Image()
image_tmp.height = 720
image_tmp.width = 1280
image_tmp.encoding = 'rgb8'
image_tmp.step = 1280*3

def publish(imgL, imgR):
    # image topic
    # ----------------------
    # |header        |Image|
    # ----------------------
    # ----------------------
    # |stamp|frame_id|Image|
    # ----------------------
    header = Header(stamp=rospy.Time.now())
    header.frame_id = 'map'  
    image_tmp.header = header

    # image_tmp.data = np.array(imgL).tostring()
    image_tmp.data = imgL.tostring()
    lPuber.publish(image_tmp)

    # image_tmp.data = np.array(imgR).tostring()
    image_tmp.data = imgR.tostring()
    rPuber.publish(image_tmp)


def main():
    rospy.init_node('voicer')
    cat = cv2.VideoCapture(devNum)
    cat.set(cv2.CAP_PROP_FRAME_WIDTH, 2560)
    cat.set(cv2.CAP_PROP_FRAME_HEIGHT, 720)
    print 'cat success'
    # set height and weight
    r = rospy.Rate(rate)
    while not rospy.is_shutdown():
        ret, frame = cat.read()
        publish(frame[:, :1280], frame[:, 1280:])
        cv2.imshow('l', frame[:, :1280])
        if cv2.waitKey(1) == ord('q'):
            break
        r.sleep()

if __name__ == '__main__':
    main()
