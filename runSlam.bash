# export DISPLAY=:0.0
# xhost +local:root
source devel/setup.bash
rosrun ORB_SLAM2 Stereo src/ORB_SLAM2/Vocabulary/ORBvoc.bin myStereo.yaml true
# rosrun ORB_SLAM2 Stereo src/ORB_SLAM2/Vocabulary/ORBvoc.txt myStereo.yaml true
