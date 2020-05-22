#!/usr/bin/env python

import rospy
from std_msgs.msg import Header, String
from sensor_msgs.msg import PointCloud2
from sensor_msgs import point_cloud2
import numpy as np

def callback(data):
    pass

def main():
    rospy.init_node('checker')
    rospy.Subscriber('/pointCloudMap', PointCloud2, callback)
    puber = rospy.Publisher('/guide', String, queue_size=1)
    rospy.spin()

if __name__ == '__main__':
    main()
