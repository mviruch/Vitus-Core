#!/usr/bin/env python

import rospy
from std_msgs.msg import String
# sudo apt-get install python-pyaudio
import pyaudio
import wave

def callback(data):
    t = {
            'ahead': 'head',
            'back' : 'back'
            }
    filename = '/home/ipluto/res/src/pyAudio/scripts/lemon.wav'
    wf = wave.open(filename, 'rb')
    p = pyaudio.PyAudio()
    stream = p.open(format=p.get_format_from_width(wf.getsampwidth()),
                    channels=wf.getnchannels(),
                    rate=wf.getframerate(),
                    output=True)
    data = wf.readframes(1024)
    while data != b'':
        stream.write(data)
        data = wf.readframes(1024)

    stream.stop_stream()
    stream.close()
    p.terminate()

def main():
    rospy.init_node('audio')
    rospy.Subscriber('/guide', String, callback)
    rospy.spin()

if __name__ == '__main__':
    main()
