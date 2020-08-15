FROM ubuntu:20.04
LABEL maintainer="Piotr Lewandowski <contact@piotrlewandowski.info>"

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update system
RUN apt-get update
RUN apt-get -y install apt-utils

# Install git
RUN apt-get -y install git

# Install Cpp
RUN apt-get -y install g++ gcc cmake

# Install Gstreamer
RUN apt-get -y install libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good \
gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools \
gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-pulseaudio

# Install Golang
RUN apt-get -y install golang

# Install ZeroMQ
RUN apt-get -y install libzmq5 libzmq3-dev
RUN go get github.com/pebbe/zmq4
