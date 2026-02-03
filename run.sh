#!/bin/bash

# Enable X11 forwarding
xhost +local:root

# Run the Sawyer haptic teleoperation container
sudo docker run -it --privileged --net=host \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -e XDG_RUNTIME_DIR=/run/user/$(id -u) \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /run/user/$(id -u):/run/user/$(id -u) \
  -v $(pwd)/catkin_ws/src/SAWYER:/root/catkin_ws/src/SAWYER \
  -v $(pwd)/catkin_ws/src/Geomagic_Touch_ROS_Drivers:/root/catkin_ws/src/Geomagic_Touch_ROS_Drivers \
  -v $(pwd)/catkin_ws/src/sawyer_touchx_teleop:/root/catkin_ws/src/sawyer_touchx_teleop \
  -v ~/OpenHaptics:/opt/OpenHaptics:ro \
  -v ~/Downloads/TouchDriver_2024_09_19:/root/TouchDriver_2024_09_19:ro \
  -v ~/TouchLibs/libPhantomManagerLite.so:/usr/lib/libPhantomManagerLite.so:ro \
  -v ~/TouchLibs/libPhantomIOLib42.so:/usr/lib/libPhantomIOLib42.so:ro \
  -v ~/TouchLibs/libHL.so.3.4.0:/usr/lib/libHL.so.3.4:ro \
  -v ~/TouchLibs/libHD.so.3.4.0:/usr/lib/libHD.so.3.4:ro \
  -v ~/TouchLibs/libHDU.a:/usr/lib/libHDU.a:ro \
  sawyer_noetic:latest
