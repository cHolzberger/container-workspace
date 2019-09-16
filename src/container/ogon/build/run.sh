#!/bin/bash

apt-get update
set -euxo pipefail

for i in /build/run-*.sh; do
	(
	export PKG_CONFIG_PATH=/opt/ogon/lib/pkgconfig/:/opt/ogon/lib/x86_64-linux-gnu/pkgconfig/:/usr/lib/pkgconfig
	 source $i 
	) 2>&1 | tee /$i.log | sed -e "s/^/[$(basename $i ):`hostname`] /"
done

echo -e "asd\nasd" | passwd root
