#!/bin/bash
cd /usr/src

cd ogon-greeter-qt

cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/opt/ogon -DCMAKE_PREFIX_PATH=/opt/ogon/ .

make -j $(grep -c '^processor' /proc/cpuinfo) install

cd ..


