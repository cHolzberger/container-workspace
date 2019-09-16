#!/bin/bash
cd /usr/src
cd freerdp-ogon

cmake -DCMAKE_BUILD_TYPE=Debug -DWITH_SERVER=ON -DCMAKE_INSTALL_PREFIX=/opt/ogon -DCMAKE_PREFIX_PATH=/opt/ogon/ -DWITH_GSTREAMER_1_0=OFF .
make -j $(grep -c '^processor' /proc/cpuinfo) install

cd ..
