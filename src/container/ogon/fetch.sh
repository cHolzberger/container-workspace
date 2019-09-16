#!/bin/bash 
gc="git clone --single-branch --depth 1 "
git clone --single-branch --depth 1  https://github.com/ogon-project/freerdp-ogon ./remote/freerdp-ogon
git clone --single-branch --depth 1  https://github.com/ogon-project/ogon.git ./remote/ogon
git clone https://github.com/ogon-project/ogon-platform-qt.git ./remote/ogon-platform-qt
git clone --single-branch --depth 1  https://github.com/ogon-project/ogon-apps.git ./remote/ogon-apps
git clone --single-branch --depth 1  https://github.com/ogon-project/xserver-ogon.git ./remote/xserver-ogon
git clone --single-branch --depth 1  https://github.com/ogon-project/ogon-channels ./remote/ogon-channels
git clone https://github.com/ogon-project/pulseaudio-ogon ./remote/pulseaudio-ogon
git clone  --single-branch --depth 1  https://github.com/ogon-project/ogon-greeter-qt.git ./remote/ogon-greeter-qt
git clone --single-branch --depth 1  https://gitlab.freedesktop.org/xorg/lib/libxfont.git --branch libXfont-1.5-branch ./remote/libxfont
$gc https://github.com/ARMmbed/mbedtls.git --branch mbedtls-2.16 ./remote/mbedtls
$gc https://github.com/ogon-project/weston-ogon.git ./remote/weston-ogon
wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB -O ./remote/intel-ippi.pub
wget https://apt.repos.intel.com/setup/intelproducts.list -O ./remote/intelproducts.list 
