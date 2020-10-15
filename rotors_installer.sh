#!/bin/bash

# Remove all preinstalled rotors packages and install prerequisits
sudo apt-get remove ros-melodic-rotors.*
sudo apt-get install python-pip
 pip install --upgrade pip
 pip install future

# Installation process according to ASL.
# NOTE: remove or rename catkin_ws before executing this script.
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
wstool init
wget https://raw.githubusercontent.com/ethz-asl/rotors_simulator/master/rotors_hil.rosinstall
wstool merge rotors_hil.rosinstall
wstool update

# Build the workspace
cd ~/catkin_ws/
catkin build

# Add setup file to .bashrc
if ! grep -q devel/setup.bash /home/griffin/.bashrc; then
	echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
fi

source ~/.bashrc

# Install external state estimator
if [[ "$1" == "true" ]]; then
	cd ~/catkin_ws/src
	wstool set ethzasl_msf https://github.com/ethz-asl/ethzasl_msf.git --git -y
	wstool set rotors_simulator_demos https://github.com/ethz-asl/rotors_simulator_demos.git --git -y
	wstool set glog_catkin https://github.com/ethz-asl/glog_catkin.git --git -y
	wstool set catkin_simple https://github.com/catkin/catkin_simple.git --git -y
	wstool update
	cd ~/catkin_ws/
	catkin build
	source ~/.bashrc
fi
