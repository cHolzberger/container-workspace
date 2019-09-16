#!/bin/bash
set -exo pipefail

[[ ! -d build ]] && mkdir build

[[ -f build/clr_cn ]] && source build/clr_cn || clr_cn=$(buildah from clearlinux/golang)
echo "clr_cn=$clr_cn" > build/clr_cn

[[ -f build/cn ]] && source build/cn || cn=$(buildah from clearlinux:base)
echo "cn=$cn" > build/cn

m=$(buildah mount $cn)


echo ' --> Build Binaries'
buildah run $clr_cn -- swupd bundle-add make

clr_m=$(buildah mount $clr_cn)
mkdir -p $clr_m/go/src/github.com/StackExchange/
cp -r remote/coredns $clr_m/go/src
cp -r remote/dnscontrol $clr_m/go/src/github.com/StackExchange/

buildah config --workingdir /go/src/coredns --env GOPATH=/go $clr_cn
buildah run $clr_cn -- make coredns

buildah config --workingdir /go/src/github.com/StackExchange/dnscontrol --env GOPATH=/go $clr_cn
buildah run $clr_cn -- go run build/build.go -os=linux

echo ' --> Copy Binaries'

cp $clr_m/go/src/coredns/coredns $m/usr/bin/coredns
cp $clr_m/go/src/github.com/StackExchange/dnscontrol/dnscontrol-Linux $m/usr/bin/dnscontrol

echo ' --> Copy config'
mkdir $m/config
cp ./src/* $m/config

buildah config --workingdir /config --cmd "/usr/bin/coredns -conf /config/Corefile" $cn

echo 
echo   '=== > Commit / Tag'
echo 

buildah commit $cn mosaiksoftware/coredns
buildah tag mosaiksoftware/coredns docker.io/mosaiksoftware/coredns

echo 
echo '===> Unmount'
echo 

buildah umount $cn
buildah umount $clr_cn

echo 
echo   '=== > Push'
echo 

buildah push mosaiksoftware/coredns

echo 
echo  '===> Cleanup'
echo 
rm build/cn
buildah rm $cn
rm build/clr_cn
buildah rm $clr_cn

