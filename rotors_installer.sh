#!/bin/bash

# Remove all preinstalled RotorS packages and install prerequisits
sudo apt update
sudo apt-get remove ros-melodic-rotors.*
sudo apt-get install python-pip
pip install --upgrade pip
pip install future

# Install RotorS dependencies
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt-get install ros-melodic-desktop-full ros-melodic-joy ros-melodic-octomap-ros ros-melodic-mavlink python-wstool python-rosdep python-catkin-tools protobuf-compiler libgoogle-glog-dev ros-melodic-control-toolbox ros-melodic-mavros -y
sudo rosdep init
rosdep update
source /opt/ros/melodic/setup.bash


# Installation process according to ASL.
# NOTE: remove or rename catkin_ws before executing this script.
mkdir -p $HOME/catkin_ws/src
cd $HOME/catkin_ws/src
catkin_init_workspace
wstool init
wget https://raw.githubusercontent.com/ethz-asl/rotors_simulator/master/rotors_hil.rosinstall
wstool merge rotors_hil.rosinstall
wstool update
c
# Install external state estimator
if [[ "$1" == "true" ]]; then
	cd ~/catkin_ws/src
	wstool set ethzasl_msf https://github.com/ethz-asl/ethzasl_msf.git --git -y
	wstool set rotors_simulator_demos https://github.com/ethz-asl/rotors_simulator_demos.git --git -y
	wstool set glog_catkin https://github.com/ethz-asl/glog_catkin.git --git -y
	wstool set catkin_simple https://github.com/catkin/catkin_simple.git --git -y
	wstool update
fi

# Build the workspace
cd $HOME/catkin_ws/
catkin build

# Add setup file to .bashrc if it does not already exist
if ! grep -q devel/setup.bash $HOME/.bashrc; then
	echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
fi

source $HOME/.bashrc


