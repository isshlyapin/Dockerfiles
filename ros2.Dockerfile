FROM ubuntu:24.04

RUN apt update && apt upgrade -y

RUN apt install locales -y; \
    locale-gen en_US en_US.UTF-8; \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8; \
    export LANG=en_US.UTF-8

RUN apt install software-properties-common -y; \
    add-apt-repository universe -y

RUN apt update && apt install curl -y; \
    curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN apt update && apt install ros-dev-tools -y

RUN apt update && apt upgrade -y

RUN apt install -y ros-jazzy-ros-gz
RUN apt install -y ros-jazzy-desktop
RUN apt install -y ros-jazzy-magic-enum
RUN apt install -y ros-jazzy-eigen3-cmake-module

RUN apt install -y git-all cmake gcc g++

RUN curl -LsSf https://astral.sh/uv/install.sh | sh 

RUN wget https://apt.llvm.org/llvm.sh
RUN chmod +x llvm.sh
RUN ./llvm.sh 19 all
