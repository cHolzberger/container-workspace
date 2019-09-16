#!/bin/bash
cd /usr/src
cd freerdp-ogon

cmake -DCMAKE_BUILD_TYPE=Debug -DWITH_SERVER=ON -DCMAKE_INSTALL_PREFIX=/opt/ogon -DWITH_MBEDTLS=ON -DCMAKE_PREFIX_PATH=/opt/ogon/ -DWITH_GSTREAMER_1_0=OFF -DWITH_PCSC=OFF -DWITH_OPENSSL=OFF -trace -debug-output -Wdev . 
make -j $(grep -c '^processor' /proc/cpuinfo) install

cd ..
