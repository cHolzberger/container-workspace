#!/bin/bash
cd /usr/src

cd libxfont/  
[[ ! -d output ]] && mkdir -p output 
cd output

../autogen.sh --prefix=/opt/ogon

make && sudo make install

cd ../..

cd xserver-ogon

NOCONFIGURE=10 ./autogen.sh

PKG_CONFIG_PATH=/opt/ogon/lib/pkgconfig/:/opt/ogon/share/pkgconfig:/opt/ogon/lib/x86_64-linux-gnu/pkgconfig/ ./configure --disable-xfree86-utils --disable-linux-acpi --disable-linux-apm --disable-xorg --disable-xvfb --disable-xquartz --disable-standalone-xpbproxy --disable-xwin --disable-glamor --disable-kdrive --disable-xephyr --disable-xfake --disable-xfbdev --disable-kdrive-kbd --disable-kdrive-mouse --disable-kdrive-evdev --with-vendor-web="http://www.ogon-project.com" --disable-xquartz --disable-xnest --disable-xorg  --prefix=/opt/ogon/ --enable-xogon --disable-xwayland --with-xkb-output=/usr/share/X11/xkb/compiled --with-xkb-path=/usr/share/X11/xkb --with-xkb-bin-directory=/usr/bin/ LDFLAGS="-Wl,-rpath=/opt/ogon/lib:/opt/ogon/lib/x86_64-linux-gnu/"

make  -j $(grep -c '^processor' /proc/cpuinfo)

cd hw/xogon/

make install

cd ../../../

