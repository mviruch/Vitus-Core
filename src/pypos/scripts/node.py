#!/usr/bin/env python

import rospy
import math
from std_msgs.msg import Header, String
from geometry_msgs.msg import PoseStamped
from tf.transformations import euler_from_quaternion
import matplotlib.pyplot as plt
from matplotlib.patches import Circle
from mpl_toolkits.mplot3d import Axes3D

x = 0
y = 0
z = 0

def callback(p):
    global x, y, z
    ori = p.pose.orientation
    po = p.pose.position
    head = {'x':ori.x, 'y':ori.y, 'z':ori.z, 'w':ori.w}
    (roll, pitch, yaw) = euler_from_quaternion([ori.x, ori.y, ori.z, ori.w])
    # print '{} {} {}'.format(roll, pitch, yaw)
    # print 'current position (x:%f, y:%f, z:%f), theta:%f'%(ori.x, ori.y, ori.z, yaw)
    x = po.x
    y = po.y
    z = po.z

def main():
    rospy.init_node('pos')
    rospy.Subscriber('/posestamped', PoseStamped, callback)
    puber = rospy.Publisher('/serBluetooth', String, queue_size=1)
    rospy.spin()

if __name__ == '__main__':
    main()
