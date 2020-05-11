
from pyqtgraph.Qt import QtCore, QtGui
import pyqtgraph.opengl as gl
import numpy as np

app = QtGui.QApplication([])
w = gl.GLViewWidget()
w.show()

g = gl.GLGridItem()
w.addItem(g)

pos1 = np.empty((100, 3))

pos1 = np.random.randint(0, 10, (100, 3))
sp1 = gl.GLScatterPlotItem(pos=pos1, size=3)

w.addItem(sp1)

pos2 = np.empty((100, 3))
pos2 = np.random.randint(-10, 0, (100, 3))
sp2 = gl.GLScatterPlotItem(pos=pos2, size=3)

w.addItem(sp2)

if __name__ == '__main__':
    QtGui.QApplication.instance().exec_()

