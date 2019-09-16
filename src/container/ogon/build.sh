#!/bin/bash
set -euxo pipefail
[[ -e "cn" ]] && source cn 
if [[ -z ${cn:-} ]]; then
	from="debian"
	cn=$(buildah from debian:stable-backports) 
	buildah config --hostname "$from" $cn
	echo "cn=$cn" > cn
fi
m=$(buildah mount $cn) 

mkdir -p $m/usr/src 
rsync -a remote/ $m/usr/src/
rsync -a remote-overlay/ $m/usr/src/
rsync --delete-after -a build/ $m/build

buildah run $cn -- bash /build/run.sh
rm -rf $m/usr/src 

buildah commit $cn "ogon"
