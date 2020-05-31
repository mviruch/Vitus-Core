cmake_minimum_required(VERSION 2.8.3)
project(ORB_SLAM2)

set(MONOCULAR 0)
set(MONOCULAR-AR 0)
set(RGB-D 0)
set(STEREO 1)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  tf
  sensor_msgs
  image_transport
  cv_bridge
  message_generation
)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}  -Wall  -O3 -march=native ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall  -O3 -march=native")
# Check C++11 or C++0x support
include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
CHECK_CXX_COMPILER_FLAG("-std=c++0x" COMPILER_SUPPORTS_CXX0X)
if(COMPILER_SUPPORTS_CXX11)
   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
   add_definitions(-DCOMPILEDWITHC11)
   message(STATUS "Using flag -std=c++11.")
elseif(COMPILER_SUPPORTS_CXX0X)
   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
   add_definitions(-DCOMPILEDWITHC0X)
   message(STATUS "Using flag -std=c++0x.")
else()
   message(FATAL_ERROR "The compiler ${CMAKE_CXX_COMPILER} has no C++11 support. Please use a different C++ compiler.")
endif()
LIST(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../../../cmake_modules)

find_package(OpenCV 3.1 REQUIRED)
find_package(Eigen3 REQUIRED)
find_package(Pangolin REQUIRED)
find_package(PCL REQUIRED)



#LIST(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../../../cmake_modules)
#LIST(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake_modules)

add_message_files(
  FILES
  keyPointPCLs.msg
  pointDepth.msg
)

generate_messages(
  DEPENDENCIES
  ORB_SLAM2
  tf
  sensor_msgs
  std_msgs
)

catkin_package(
)
#catkin_package (
#  CATKIN_DEPENDS roscpp rospy cv_bridge image_transport tf sensor_msgs
#  LIBRARIES {PROJECT_NAME} libDBoW2 libg2o
#)


include_directories(
# include
  ${catkin_INCLUDE_DIRS}
  ${PCL_INCLUDE_DIRS}
  ${PROJECT_SOURCE_DIR}
  ${PROJECT_SOURCE_DIR}/lib
  ${PROJECT_SOURCE_DIR}/../../../
  ${PROJECT_SOURCE_DIR}/../../../../include
  ${EIGEN3_INCLUDE_DIR}
  ${Pangolin_INCLUDE_DIRS}
  ${PCL_LIBRARIES}
)


set(LIBS 
  ${catkin_LIBRARIES}
  ${PROJECT_SOURCE_DIR}/lib
  ${OpenCV_LIBS} 
  ${EIGEN3_LIBS}
  ${Pangolin_LIBRARIES} ${PROJECT_SOURCE_DIR}/../../../Thirdparty/DBoW2/lib/libDBoW2.so
  ${PCL_LIBRARIES}
  ${PROJECT_SOURCE_DIR}/../../../Thirdparty/g2o/lib/libg2o.so
  ${PROJECT_SOURCE_DIR}/../../../lib/libORB_SLAM2.so
  -lboost_system
)


if(￥{MONOCULAR})
  # Node for monocular camera
  add_executable(Mono
    src/ros_mono.cc
  )

  target_link_libraries(Mono
    ${LIBS}
  )
endif()

if(${MONOCULAR-AR})
  # Node for monocular camera (Augmented Reality Demo)
  add_executable(MonoAR
    src/AR/ros_mono_ar.cc
    src/AR/ViewerAR.h
    src/AR/ViewerAR.cc
  )

  target_link_libraries(MonoAR
    ${LIBS}
  )
endif()

if(${STEREO})
  # Node for stereo camera
  add_executable(Stereo
    lib/SlamData.cpp
    src/ros_stereo.cc
  )

  target_link_libraries(Stereo
    ${LIBS}
  )
endif()

if(${RGB-D})
  # Node for RGB-D camera
  add_executable(RGBD
    src/ros_rgbd.cc
  )

  target_link_libraries(RGBD
    ${LIBS}
  )
endif()