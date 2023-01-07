#!/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc
timeout 10 ros2 launch robosys_ros2 talk_listen.launch.py > /tmp/robosys_ros2.log

cat /tmp/robosys_ros2.log |
grep 'Listen: 10'
