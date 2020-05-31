#!/usr/bin/env python

import rospy
import message_filters
from std_msgs.msg import Header, String
from sensor_msgs.msg import Image
from sensor_msgs.msg import PointCloud2
from sensor_msgs import point_cloud2
from ORB_SLAM2.msg import keyPointPCLs, pointDepth
import numpy as np

def callback(image, kps):
    for i in range(kps.size):
        # print kps.pointDepth
        continue

def main():
    rospy.init_node('checker')
    # rospy.Subscriber('/pointCloudMap', PointCloud2, callback)
    # puber = rospy.Publisher('/guide', String, queue_size=1)
    # rospy.Subscriber('/ref_keypoint_pcl_pub', keyPointPCLs, callback)
    imageSub = message_filters.Subscriber('/camera/left/image_raw', Image)
    kpsSub = message_filters.Subscriber('/ref_keypoint_pcl_pub', keyPointPCLs)
    
    ts = message_filters.TimeSynchronizer([imageSub, kpsSub], 10)
    ts.registerCallback(callback)
    rospy.spin()

if __name__ == '__main__':
    main()

