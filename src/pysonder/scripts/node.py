#!/usr/bin/env python

import argparse
import sys
import rospy
from std_msgs.msg import Header
from sensor_msgs.msg import Image
import cv2
import numpy as np

rate = 10   # 10hz

class var:
    # devNum = 0  # ls /dev/video*
    puber = {}
    imgTmp = {}
    stamp = 0
    stampMax = 64

def display(frame):
    print frame.shape
    cv2.imshow('frame', frame)
    cv2.waitKey(1)

def publish(img, name, header):
    var.imgTmp[name].header = header
    var.imgTmp[name].data = img.tostring()
    var.puber[name].publish(var.imgTmp[name])
    # display(img)

def publishStereo(img, width):
    # image topic
    # ----------------------
    # |header        |Image|
    # ----------------------
    # ----------------------
    # |stamp|frame_id|Image|
    # ----------------------
    imgL = img[:, width:]
    imgR = img[:, :width]
    header = Header(stamp=rospy.Time.now())
    # header = Header(stamp=var.stamp)
    header.frame_id = 'map'
    publish(imgL, 'left', header)
    publish(imgR, 'right', header)
    # var.stamp = (var.stamp+1)%var.stampMax

def publistMono(img, width):
    header = Header(stamp=rospy.Time.now())
    # header = Header(stamp=var.stamp)
    header.frame_id = 'map'
    publish(img, 'mono', header)
    # var.stamp = (var.stamp+1)%var.stampMax

def createImage(h, w):
    ret = Image()
    ret.height = h
    ret.width = w
    ret.encoding = 'rgb8'
    ret.step = w*3
    return ret

def main(devNum, h, w, func, node):
    rospy.init_node('voicer')
    r = rospy.Rate(rate)
    cat = cv2.VideoCapture(devNum)
    cat.set(cv2.CAP_PROP_FRAME_HEIGHT, h)
    if node == 'Stereo':
        cat.set(cv2.CAP_PROP_FRAME_WIDTH, w*2)
        var.imgTmp['left'] = createImage(h, w)
        var.imgTmp['right'] = createImage(h, w)
        var.puber['left'] = rospy.Publisher('/camera/left/image_raw', Image, queue_size=1)
        var.puber['right'] = rospy.Publisher('/camera/right/image_raw', Image, queue_size=1)
    else:
        cat.set(cv2.CAP_PROP_FRAME_WIDTH, w)
        var.imgTmp['mono'] = createImage(h, w)
        var.puber['mono'] = rospy.Publisher('/camera/image_raw', Image, queue_size=1)

    while not rospy.is_shutdown():
        ret, frame = cat.read()
        func(frame, w)
        # publish(frame[:, :1280], frame[:, 1280:])
        r.sleep()

if __name__ == '__main__':
    # print len(sys.argv)
    parser = argparse.ArgumentParser()

    parser.add_argument('--deviceNum', help='the device number which u want to use, command ls /dev/video*\
        will show all of video device')
    parser.add_argument('--node', help='type of the node which will be running, like Stereo, Mono')
    parser.add_argument('--height', help='image height')
    parser.add_argument('--width', help='image width, noteice it will be helf of the real val when u use Stereo')
    sys.argv = rospy.myargv(argv=sys.argv)

    args = parser.parse_args()
    if args.node == 'Stereo':
        func = publishStereo
    else:
        func = publistMono

    main(int(args.deviceNum), int(args.height), int(args.width), func, args.node)
