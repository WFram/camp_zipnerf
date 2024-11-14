FROM nvidia/cuda:12.6.2-cudnn-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DBUS_SESSION_BUS_ADDRESS=unix:path=/var/run/dbus/system_bus_socket

RUN apt-get update && apt-get install -y apt-transport-https
RUN apt-get update && apt-get install build-essential software-properties-common -y \
    sudo \
    git \
    cmake \
    wget \
    zsh \
    graphviz \
    ffmpeg \
    unzip \
    libgl1-mesa-dev \
    libhdf5-dev \
    libfreetype6-dev \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libavutil-dev \
    libfreeimage-dev \
    libglew-dev \
    qtbase5-dev \
    libqt5opengl5-dev \
    libassimp-dev \
    libboost-all-dev \
    libgtk-3-dev \
    libopencv-dev \
    libglfw3-dev \
    libavdevice-dev \
    libeigen3-dev \
    libxxf86vm-dev \
    libembree-dev \
    libglm-dev \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh && \
    /bin/bash miniconda.sh -b -p /opt/conda && \
    rm miniconda.sh

ENV PATH=$PATH:/opt/conda/bin

RUN conda create --name camp_zipnerf python=3.11 -y
