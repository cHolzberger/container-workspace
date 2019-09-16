#!/bin/bash
cd /usr/src

cd ogon-platform-qt

qtchooser -qt=qt5 -run-tool=qmake ADDITIONAL_RPATHS=/opt/ogon/lib/:/opt/ogon/lib/x86_64-linux-gnu/pkgconfig/ PREFIX=/opt/ogon
#qmake ADDITIONAL_RPATHS=/opt/ogon/lib/:/opt/ogon/lib/x86_64-linux-gnu/pkgconfig/ PREFIX=/opt/ogon .

make && make install
cd ..

ln -sf /opt/ogon/lib/qt5/plugins/platforms/libogon.so /usr/lib/x86_64-linux-gnu/qt5/plugins/platforms/libogon.so


