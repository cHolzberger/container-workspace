#!/bin/bash
cd /usr/src



cd ogon-channels

cmake -DCMAKE_PREFIX_PATH=/opt/ogon -DCMAKE_INSTALL_PREFIX=/opt/ogon .

make -j $(grep -c '^processor' /proc/cpuinfo) install

cd ..


cd pulseaudio-ogon

NOCONFIGURE=YES ./bootstrap.sh

PKG_CONFIG_PATH=/opt/ogon/lib/pkgconfig/:/opt/ogon/share/pkgconfig:/opt/ogon/lib/x86_64-linux-gnu/pkgconfig/ ./configure -disable-oss-output --enable-oss-wrapper --disable-alsa --disable-jack --disable-xen --disable-tests --disable-udev --enable-ogon --prefix=/opt/ogon --disable-glib2 --disable-avahi --disable-ipv6 --disable-openssl --enable-x11 --disable-systemd-journal --disable-systemd-daemon LDFLAGS="-Wl,-rpath=/opt/ogon/lib:/opt/ogon/lib/x86_64-linux-gnu/"

make -j $(grep -c '^processor' /proc/cpuinfo) install

cd ..
