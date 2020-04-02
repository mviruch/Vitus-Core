#!/usr/bin/env python

import rospy
from std_msgs.msg import String

def callback(data):
    pass

def main():
    rospy.init_node('connection')
    rospy.Subscriber('/serBluetooth', String, callback)
    rospy.spin()

if __name__ == '__main__':
    main()
