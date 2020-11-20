# Documentation

## How to format and Document your files
We use a document format as proposed [here](http://www.edparrish.net/common/cppdoc.html).

## Install RotorS on ROS Melodic (please add corrections)

### Easiest way
- Download the ```rotors_installer.sh``` script from this repo
- Go to the directory where you downloaded the file and enter ```chmod +x rotors_installer.sh```
- Enter ```./rotors_installer.sh``` to only install rotors_simulator or enter ```./rotors_installer.sh true``` to also install the state estimator.

### Normal install Process
**NOTE:** go to ```cd /opt/ros/melodic/share``` and ```sudo apt-get remove ros-melodic-rotors.*```. Installation will not work if any rotors packages are preinstalled with ros.
Follow the process described [here](https://github.com/ethz-asl/rotors_simulator) for kinetic.
```
sudo apt-get update
sudo apt-get install ros-melodic-joy ros-melodic-octomap-ros ros-melodic-mavlink python-wstool python-catkin-tools protobuf-compiler libgoogle-glog-dev ros-melodic-control-toolbox ros-melodic-mavros
sudo rosdep init
rosdep update
source /opt/ros/melodic/setup.bash
```
Go to ```cd ~/src```
```
wget https://raw.githubusercontent.com/ethz-asl/rotors_simulator/master/rotors_hil.rosinstall
wstool merge rotors_hil.rosinstall
wstool update
```
Go to workspace ```cd ~/catkin_ws```   

```catkin build```

```
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

## Build ros package to be visible as an eclipse project
- ```catkin build "package_name" --cmake-args -G "Eclipse CDT4 - Unix Makefiles" -D__cplusplus=201103L -D__GXX_EXPERIMENTAL_CXX0X__=1```

## Catkin build CMake error related to Eclipse
- check ```catkin config``` whether or not Additional CMake Args: none
- If this is not the case then try ```catkin config --no-cmake-args```


## .launch files
### Paths (for .launch files)
- ROS: ```cd /opt/ros/melodic/share/```
- Gazebo ```cd /usr/share/gazebo-9```


## ROS Package best Practices
Please refer to [this repo](https://github.com/leggedrobotics/ros_best_practices) for best practices.

### running teleop_twist_keyboard using ```roslaunch```
You can launch teleop_twist_keyboard (or any package for that matter) by including ```<node name = "some name" pkg = "teleop_twist_keyboard" type = "teleop_twist_keyboard.py"/>```. This has the same effect as running ```rosrun teleop_twist_keyboard teleop_twist_keyboard.py```.

### Assembling a model with RotorS
`.urdf` files in `~/catkin_ws/src/rotors_simulator/rotors_description/urdf`


## Installation UAVCAN Gui
Needed for ESCs Kotleta 20
```
sudo apt-get install -y python3-pip python3-setuptools python3-wheel
sudo apt-get install -y python3-numpy python3-pyqt5 python3-pyqt5.qtsvg git-core
sudo pip3 install git+https://github.com/UAVCAN/gui_tool@master
```
