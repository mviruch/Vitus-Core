#!/usr/bin/env python

import rospy
from std_msgs.msg import Header, String
from sensor_msgs.msg import Image
import cv2
import numpy as np

def callback(data):
    img = np.fromstring(data.data, dtype=np.uint8)
    img = img.reshape(data.height, data.width, 3)
    pass

def main():
    rospy.init_node('finder')
    rospy.Subscriber('/camera/left/image_raw', Image, callback)
    puber = rospy.Publisher('/guide', String, queue_size=1)
    rospy.spin()

if __name__ == '__main__':
    main()
