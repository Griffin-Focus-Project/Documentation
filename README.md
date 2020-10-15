# Documentation

## Catkin build CMake error related to Eclipse
- check ```catkin config``` whether or not Additional CMake Args: none
- If this is not the case then try ```catkin config --no-cmake-args```

## .launch files
### Paths (for .launch files)
- ROS: ```cd /opt/ros/melodic/share/```
- Gazebo ```cd /usr/share/gazebo-9```

### running teleop_twist_keyboard using ```roslaunch```
You can launch teleop_twist_keyboard (or any package for that matter) by including ```<node name = "some name" pkg = "teleop_twist_keyboard" type = "teleop_twist_keyboard.py"/>```. This has the same effect as running ```rosrun teleop_twist_keyboard teleop_twist_keyboard.py```.

## Install RotorS on ROS Melodic (please add corrections)

### Normal install Process
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
$ wstool merge rotors_hil.rosinstall
$ wstool update
```
Go to workspace ```cd ~/catkin_ws```   

```catkin build```

```
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
```
### Hack to fix MAV not taking off
based on [this issue](https://github.com/ethz-asl/rotors_simulator/issues/626)

- Open ```nano ~/catkin_ws/src/rotors_simulator/rotors_gazebo_plugins/CMakeLists.txt```
- Add line ```list(APPEND targets_to_install mav_msgs)``` after line ```target_link_libraries(mav_msgs ${PROTOBUF_LIBRARY} gazebo_msgs)``` (line 215)
- Go to ```cd ~/catkin_ws``` and enter ```catkin config --install```
- ```catkin build```
- Add new setup file to .bashrc ```echo "source <your_workspace>/install/setup.bash" >> ~/.bashrc```
- ```source ~/.bashrc```
- MAV should now fly ```roslaunch rotors_gazebo mav_hovering_example.launch mav_name:=firefly world_name:=basic```
