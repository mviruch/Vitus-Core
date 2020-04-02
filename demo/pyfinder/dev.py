import numpy as np
import cv2

from time import sleep

lost = 0

def trace(img):
    global lost
    # cvt to lab
    lab = cv2.cvtColor(img, cv2.COLOR_BGR2LAB)

    # guassian blur && use b
    guassian = cv2.GaussianBlur(lab[:, :, 2], (9, 9), 0)

    # then erode
    kern = np.ones((9, 9), np.uint8)
    erode = cv2.erode(guassian, kern)

    # otsu
    th, otsu = cv2.threshold(erode, 0, 255, cv2.THRESH_BINARY+cv2.THRESH_OTSU)

    # canny
    canny = cv2.Canny(otsu, 50, 150, apertureSize=3)

    # hough
    lines = cv2.HoughLines(canny, 1, np.pi/180, 100)
    if type(lines) != np.ndarray:
        lost += 1
        print('lost {}'.format(lost))
        return img

    lines = lines[:, 0, :]
    for rho, theta in lines[:]:
        a = np.cos(theta)
        b = np.sin(theta)
        x0 = a*rho
        y0 = b*rho
        x1 = int(x0 + 1000*(-b))
        y1 = int(y0 + 1000*a)
        x2 = int(x0 - 1000*(-b))
        y2 = int(y0 - 1000*a)
        cv2.line(img, (x1, y1), (x2, y2), (0, 255, 0), 1)

    return img

# using yield can speed up
def iterWindow(img, windX, windY, stepX=1, stepY=1):
    # img.shape = y, x, c
    for y in range(0, img.shape[0], stepY):
        for x in range(0, img.shape[1], stepX):
            yield x, y, img[y:y+windY, x:x+windX]

def traceG(img):
    # cvt 2 gray
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    
    # normalize
    std = np.std(gray)
    avg = np.mean(gray)
    normal = (gray - avg)/std

    # calc glcm
    for x, y, seg in iterWindow(normal, 5, 5):
        pass

    return normal

def main():
    # read img
    cap = cv2.VideoCapture('t2.mp4')
    success, frame = cap.read()

    while success:
        retImg = trace(frame)
        cv2.imshow('img', retImg)
        cv2.waitKey(1)
        # sleep(0.5)
        success, frame = cap.read()

    cv2.waitKey(0)
    cv2.destroyAllWindows()

if __name__ == '__main__':
    main()
