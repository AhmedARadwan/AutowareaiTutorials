source ~/.bashrc
sudo apt update
sudo apt install -y python-catkin-pkg python-rosdep ros-melodic-catkin
sudo apt install -y python3-pip python3-colcon-common-extensions python3-setuptools python3-vcstool
sudo pip3 install -U setuptools


mkdir -p autoware.ai/src
cd autoware.ai

wget -O autoware.ai.repos "https://gitlab.com/autowarefoundation/autoware.ai/autoware/raw/master/autoware.ai.repos?inline=false"

vcs import src < autoware.ai.repos

rosdep update
rosdep install -y --from-paths src --ignore-src --rosdistro melodic

colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release

