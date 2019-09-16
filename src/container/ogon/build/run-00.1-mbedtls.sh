#!/bin/bash

cd /usr/src/mbedtls
cmake -DCMAKE_INSTALL_PREFIX=/opt/ogon .
make
make install
