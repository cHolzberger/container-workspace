#!/bin/bash
cd /usr/src

cd weston-ogon

NOCONFIGURE=10 ./autogen.sh


export PKG_CONFIG_PATH=/opt/ogon/lib/pkgconfig/:/opt/ogon/share/pkgconfig:/opt/ogon/lib/x86_64-linux-gnu/pkgconfig/ 
PKG_CONFIG_PATH=/opt/ogon/lib/pkgconfig/:/opt/ogon/share/pkgconfig:/opt/ogon/lib/x86_64-linux-gnu/pkgconfig/ \
LDFLAGS="-Wl,-rpath=/opt/ogon/lib:/opt/ogon/lib/x86_64-linux-gnu/" \
	./configure --enable-ogon-compositor 

make  -j $(grep -c '^processor' /proc/cpuinfo)

make install

cd ../../../

