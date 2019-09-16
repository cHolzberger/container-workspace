#!/bin/bash
cd /usr/src
cd ogon

cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/opt/ogon -DCMAKE_PREFIX_PATH=/opt/ogon/ -DWITH_OPENH264=on .
make install #this needs to be single threaded because of the integrated thrift build

./misc/ogon-get-openh264-codec --accept-license

cp misc/config.ini.debian /opt/ogon/etc/ogon/config.ini
sudo ln -sf /opt/ogon/etc/dbus-1/system.d/ogon.SessionManager.conf /etc/dbus-1/system.d/
sudo cp misc/pam.d/ogon.debian /etc/pam.d/ogon

sudo cp misc/ogon-rdp-server.init /etc/init.d/ogon-rdp-server
sudo cp misc/ogon-session-manager.init /etc/init.d/ogon-session-manager

mkdir -p /opt/ogon/var/run
