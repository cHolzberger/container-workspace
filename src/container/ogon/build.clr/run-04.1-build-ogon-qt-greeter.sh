#!/bin/bash
cd /usr/src

export PKG_CONFIG_PATH=/opt/ogon/lib/pkgconfig/:/opt/ogon/lib/x86_64-linux-gnu/pkgconfig/:$PKG_CONFIG_PATH
cd ogon-greeter-qt

cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/opt/ogon -DCMAKE_PREFIX_PATH=/opt/ogon/ .

make -j $(grep -c '^processor' /proc/cpuinfo) install

cd ..


