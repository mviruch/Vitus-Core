# Vitus

​	Vitus是一个帮助盲人出行的应用， 它由硬件设备，移动App所组成。
aaaaa
---

## 1. 如何安装

### 安装环境

####  [ROS kinetic](http://wiki.ros.org/cn/kinetic/Installation/Ubuntu)

 1. 添加sources.list

    ```bash
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
    ```

2. 添加公钥

   ```bash
   sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
   ```

3. 更新源

   ```bash
   sudo apt-get update
   ```

4. 安装桌面完整版

   ```bash
   sudo apt-get install ros-kinetic-desktop-full
   ```

   **注：如下载慢可更换下载源**

5. 初始化 rosdep

   ```bash
   sudo rosdep init
   rosdep update
   ```

6. 配置环境变量

   ```bash
   echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
   source ~/.bashrc
   ```

7. 安装rosinstall

   ```bash
   sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential
   ```

8. 测试

   ```bash
   roscore
   ```



---

#### Python & pip

1. Python

   ubuntu16.04 自带了python2.7

2. pip

   ```bash
   wget https://bootstrap.pypa.io/get-pip.py
   python get-pip.py
   ```



---

#### Git

1. 下载git

   ```bash
   sudo apt install git
   ```

2. 配置git

   1. 用户信息

      ```bash
      git config --global user.name "username"
      git config --global user.email youremail@example.com
      git config -l
      ```

   2. SSH Key

      ```bash
      ssh-keygen -t rsa -C "youremail@example.com"
      cat ~/.ssh/id_rsa.pub
      ```


   3. 将ssh key配置到github上

      打开[github](https://github.com/)， 点击右上角的头像， 并选择Settings

      ![settings](https://github.com/mviruch/Vitus-Core/blob/master/docs/img/PersonalSettings.png)

      在左侧Personal settings栏选择SSH and GPG keys

       ![personalSettings](https://github.com/mviruch/Vitus-Core/blob/master/docs/img/PersonalSettings.png)

      点击New SSH key ![new ssh key](https://github.com/mviruch/Vitus-Core/blob/master/docs/img/SSHKeys.png)

      将生成的SSH Key粘贴到Key中， 并在title里命名, 最后点击Add SSH key

      ![add ](https://github.com/mviruch/Vitus-Core/blob/master/docs/img/addNew.png)



---

### 下载代码仓库

1. 点击Clone or download 并复制地址

   ![clone](https://github.com/mviruch/Vitus-Core/blob/master/docs/img/clone.png)

2. 在终端中输入如下命令

   ```bash
   git clone https://github.com/mviruch/slam.git
   ```



---

### 编译[ORB_SLAM2](https://github.com/raulmur/ORB_SLAM2)

#### 安装C++11编译器

```bash
sudo apt install gcc g++
```

#### 安装[Pangolin](https://github.com/stevenlovegrove/Pangolin)

1. 安装依赖

   ```bash
   sudo apt install libglew-dev
   ```

2. 下载代码仓库

   ```bash
   git clone https://github.com/stevenlovegrove/Pangolin.git
   ```

3. 编译 & 安装

   ```bash
   cd Pangolin
   mkdir build && cd build
   cmake -DCPP11_NO_BOOST=1 ..
   make
   sudo make install
   ```



---

#### 安装[OpenCV](https://opencv.org/)

1. 安装依赖

   ```bash
   sudo apt-get install build-essential
   sudo apt-get install cmake libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
   sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
   ```

2. 下载OpenCV

   点击[此处](https://github.com/opencv/opencv/archive/3.2.0.zip) 下载OpenCV 3.2.0 版本， 解压后进入OpenCV 目录

3. 编译

   ```bash
   mkdir build && cd build
   cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ..
   make
   sudo make install
   ```



---

#### 安装Eigen3， BLAS， LAPACK

执行如下命令

```bash
sudo apt install libeigen3-dev libblas-dev liblapack-dev
```



---

#### 编译ORB_SLAM2

执行如下命令 (Examples/ROS/ORB_SLAM2)

在 ~/.bashrc末尾添加```export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:PATH/ORB_SLAM2/Examples/ROS```

**注：PATH为ORB_SLAM地址**

> 例：
>
> export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/home/ipluto/dev/src/ORB_SLAM2/Examples/ROS

```bash
source ~/.bashrc
cd ORB_SLAM2
chmod +x build.sh
chmod +x build_ros.sh
./build.sh
./build_ros.sh
```

---



### 安装opencv-python和numpy

执行如下命令

```bash
pip install numpy opencv-python
```

---
### 编译ROS包
执行如下命令
```bash
catkin_make
```



---

## 2. 如何运行

运行```roscore```

1. 双目

   执行如下命令

   ```bash
   source devel/setup.bash
   roslaunch start.launch
   ```

   必选参数:

   ​	无， 但下方列出了一些建议修改的参数

   可选参数：

   1. NODE，ORB_SLAM2运行模式， 默认值为Stereo

   2. IMG_HEIGHT， 图像高度， 默认为720

   3. IMG_WIDTH， 图像宽度， 默认为1280

      > 注： 1280为单个图像大小， 即选择1280时实际摄像头是以1280的2倍 2560打开的， 获取到的也是宽度为2560大小的图像， 经过切分处理后再发布使用

   4. DEVNUM， 设备编号， **建议修改**， 在终端中输入```ls /dev/video```后按Tab键， 可看到当前设备所拥有的视频输入设备号

   5. PATH_TO_VOCABULARY， 词库， **不建议修改， 为加速启动时间，已由原版.txt改为.bin， 修改后可能会出错**

   6. PATH_TO_SETTINGS_FILE， 标定文件， **建议修改**，双目可不修改

   7. ONLINE_RECTIFICATION， **建议不改**

2. 单目

   执行一下命令

   ```bash
   source devel/setup.bash
   roslaunch start.launch PATH_TO_SETTINGS_FILE:=/home/ipluto/Vitus-Core/src/ORB_SLAM2/Examples/Monocular/EuRoC.yaml NODE:=Mono
   ```

   必选参数:

   1. NODE， 修改为Mono， 由默认的双目模式切换到单目模式

   可选参数:

   1. IMG_HEIGHT，同上
   2. IMG_WIDTH， 同上
   3. DEVNUM， 同上
   4. PATH_TO_VOCABULARY， 同上
   5. PATH_TO_SETTINGS_FILE， 同上
   6. ONLINE_RECTIFICATION， 切换到单目时**已忽略**此参数

>注： 当修改图像尺寸(IMG_HEIGHT, IMG_WIDTH)时， 需要同时修改对应标定文件内的图像尺寸信息



---

## 3. 目录说明

<pre>
.
├── build                   ROS 生成
├── demo                    演示
│   └── pyfinder            盲道跟踪demo
├── devel                   ROS 生成
├── docs                    文档目录
│   ├── banner.txt          banner文件
│   ├── base.py             将png图片转为base64
│   ├── img                 图片目录
│   └── README.md           说明文档
├── myStereo.yaml           双目相机标定文件
├── runSlam.bash            备份
├── src                     程序目录
│   ├── CMakeLists.txt      ROS 生成
│   ├── log                 创建模块命令备份
│   ├── ORB_SLAM2           ----
│   ├── pyaudio             | 功
│   ├── pychecker           | 能
│   ├── pyconnect           | 模
│   ├── pyfinder            | 块
│   ├── pypos               |
│   └── pysonder            ----
└── start.launch            启动文件
</pre>

</pre>



---

## 4. 细节

### pyaudio

根据指令播放声音

- [x] 播放声音
- [ ] 识别指令



---

### pychecker

通过点云地图判断前方是否有障碍物， 如果有， 进行障碍物测距

- [ ] 订阅点云地图
- [ ] 判断前方是否源障碍物
- [ ] 障碍物测距



---

### pyconnect

通过蓝牙与安卓APP传输数据

- [ ] 与安卓APP进行蓝牙连接
- [ ] 接收数据并传输



---

### pyfinder

进行盲道跟踪， 并将跟踪数据发布

- [ ] 盲道跟踪



---

### pypos

订阅位姿消息， 并通过标定的方法进行行走距离检测(单位:米/.....)

- [ ] 将坐标信息通过标定的方法转换为距离信息



---

### pysonder

读取双目相机数据并发布

- [x] 读取双目相机



---
