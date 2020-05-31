#!/usr/bin/env python

import rospy
from std_msgs.msg import Header, String
from sensor_msgs.msg import PointCloud2
from sensor_msgs import point_cloud2
from pyconnect.msg import tttt
import ORB_SLAM2.msg
import numpy as np

def callback(data):
    for i in range(data.size):
        print data.pyX[i], data.pyY[i], data.mDepth[i]

def main():
    rospy.init_node('checker')
    # rospy.Subscriber('/pointCloudMap', PointCloud2, callback)
    # puber = rospy.Publisher('/guide', String, queue_size=1)
    rospy.Subscriber('/ref_keypoint_pcl_pub', keyPointPCLs, callback)
    rospy.spin()

if __name__ == '__main__':
    main()

