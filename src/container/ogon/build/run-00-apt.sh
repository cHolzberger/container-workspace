#!/bin/bash

apt-get -y update
apt-get -y install gnupg2  ca-certificates

#apt-key add /usr/src/intel-ippi.pub
#cp /usr/src/intelproducts.list /etc/apt/sources.list.d/
#apt-get update

apt-get install -y xsltproc libssl-dev libx11-dev libxext-dev libxinerama-dev libxcursor-dev \
	libxdamage-dev libxv-dev libxkbfile-dev libasound2-dev libcups2-dev libxml2 libxml2-dev \
	libxi-dev libsystemd-dev libxrandr-dev \
       	libprotobuf-dev libprotoc-dev protobuf-compiler protobuf-c-compiler \
	  libpam0g-dev libboost-dev libdbus-1-dev \
	  automake libpam-systemd ca-certificates \
	    libprotobuf-c-dev ssl-cert sudo libxkbcommon-dev libfontconfig1-dev libmtdev-dev libudev-dev \
	    libegl1-mesa-dev  qt5-qmake qtbase5-private-dev qtbase5-dev qt5-default qttools5-dev qttools5-dev-tools qtwayland5-dev-tools \
	    libsm-dev libxtst-dev libx11-xcb-dev intltool autopoint libltdl-dev libcap-dev libsm-dev libjson-c-dev libsndfile1-dev intltool \
	    libfuse-dev autoconf automake xutils-dev libtool libpixman-1-dev x11proto-bigreqs-dev x11proto-composite-dev x11proto-dri3-dev \
	    x11proto-present-dev x11proto-resource-dev x11proto-scrnsaver-dev x11proto-fonts-dev x11proto-xf86dri-dev x11proto-xcmisc-dev x11proto-record-dev xfonts-utils x11-xkb-utils libfontenc-dev \
	    git build-essential cmake  curl unzip libxcb-xfixes0-dev libx11-xcb-dev libxcb-composite0-dev xcb-proto libxcursor1 libcairo2-dev libavcodec-dev \
	    libegl1-mesa-dev libwayland-egl-backend-dev \
	    libgles2 libgles2-mesa libgles2-mesa-dev libgbm-dev \
	    wayland-protocols

#intel-ipp-2019.4-070 intel-mpi-2019.4-070 intel-mkl-2019.4-070 gnupg2

#	libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libxi-dev libgstreamer-plugins-base1.0-dev libsystemd-dev \


