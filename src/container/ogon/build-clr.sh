#!/bin/bash
set -euxo pipefail
[[ -e "cn" ]] && source cn.clr
if [[ -z ${cn:-} ]]; then
	cn=$(buildah from clearlinux:base) 
	echo "cn=$cn" > cn.clr
fi
m=$(buildah mount $cn) 

mkdir -p $m/usr/src 
rsync --delete-after -av remote/ $m/usr/src/
rsync --delete-after -av build.clr/ $m/build

buildah run $cn -- bash /build/run.sh
rm -rf $m/usr/src 

buildah commit $cn "ogon-clr"
