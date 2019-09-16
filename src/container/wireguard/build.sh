BUILD_NAME=$(cat build.name)
BUILD_VERSION=$(cat build.version)
BUILD_ALIAS=$(cat build.alias)

echo "Building $BUILD_NAME : $BUILD_VERSION"

cn=$(buildah from "clearlinux:base")
m=$(buildah mount $cn)

buildah run $cn -- swupd bundle-add  network-basic jq
cp remote/gobetween $m/bin/gobetween
cp remote/consul-template $m/bin/consul-template

buildah umount $cn

buildah commit $cn "$BUILD_NAME:$BUILD_VERSION"
for i in $BUILD_ALIAS; do
	echo "=> Tagging $i:$BUILD_VERSION"
	buildah tag "$BUILD_NAME:$BUILD_VERSION" "$i:$BUILD_VERSION"
done
