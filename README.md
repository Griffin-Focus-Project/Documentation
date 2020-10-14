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
