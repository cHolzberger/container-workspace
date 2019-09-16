#!/bin/bash
cd /usr/src



cd ogon-apps

cmake -DCMAKE_PREFIX_PATH=/opt/ogon/ -DCMAKE_INSTALL_PREFIX=/opt/ogon .

make -j $(grep -c '^processor' /proc/cpuinfo) install

cd ..
