#!/usr/bin/env python

import time
import sys
import rospy
from std_msgs.msg import Header, String
from sensor_msgs.msg import PointCloud2
from sensor_msgs import point_cloud2
from PyQt5 import QtWidgets
from PyQt5.QtWidgets import *
from PyQt5.QtGui import *
from PyQt5.QtCore import *
import pyqtgraph.opengl as gl
import numpy as np

class graph(QWidget):
    def __init__(self):
        super(graph, self).__init__()
        self.initUI()

    def initUI(self):
        layoutChart = QtWidgets.QGridLayout()
        self.setLayout(layoutChart)
        self.view = gl.GLViewWidget()
        g = gl.GLGridItem()
        self.view.addItem(g)
        layoutChart.addWidget(self.view, 0, 0)
        self.resize(800, 800)

    def drawPoints(self, points):
        pos = points[:, 0:3]
        sp = gl.GLScatterPlotItem(pos=pos, size=3)
        self.view.addItem(sp)


class Signal(QObject):
    sig = pyqtSignal(object)
    def __init__(self):
        QObject.__init__(self)

    def callback(self, data):
        gen = point_cloud2.read_points(data)
        points = np.array(list(gen))
        if points.shape != (0, ):
            self.sig.emit(points)


def main():
    app = QtWidgets.QApplication([])
    gui = graph()
    gui.show()
    signal = Signal()
    signal.sig.connect(gui.drawPoints)

    rospy.init_node('demo')
    rospy.Subscriber('/point_cloud_all', PointCloud2, signal.callback)
    # rospy.Subscriber('/point_cloud_ref', PointCloud2, signal.callback)
    # puber = rospy.Publisher('/guide', String, queue_size=1)
    app.exec_()

if __name__ == '__main__':
    main()

'''
def cluster(points, radius=0.2):
    """
    points: pointcloud
    radius: max cluster range
    """
    items = []
    while len(points)>1:
        item = np.array([points[0]])
        base = points[0]
        points = np.delete(points, 0, 0)
        distance = (points[:,0]-base[0])**2+(points[:,1]-base[1])**2
        infected_points = np.where(distance <= radius**2)
        item = np.append(item, points[infected_points], axis=0)
        border_points = points[infected_points]
        points = np.delete(points, infected_points, 0)
        while len(border_points) > 0:
            border_base = border_points[0]
            border_points = np.delete(border_points, 0, 0)
            border_distance = (points[:,0]-border_base[0])**2+(points[:,1]-border_base[1])**2
            border_infected_points = np.where(border_distance <= radius**2)
            item = np.append(item, points[border_infected_points], axis=0)
            border_points = points[border_infected_points]
            points = np.delete(points, border_infected_points, 0)
        items.append(item)
    return items
'''
