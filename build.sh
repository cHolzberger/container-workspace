#!/bin/bash
#Setting up some colors for helping read the demo output
bold=$(tput bold); red=$(tput setaf 1); green=$(tput setaf 2); yellow=$(tput setaf 3); blue=$(tput setaf 4); cyan=$(tput setaf 6); reset=$(tput sgr0)

#export http_proxy="http://192.168.254.13:8000"
#export https_proxy=$http_proxy
#export HTTP_PROXY=$http_proxy
#export HTTPS_PROXY=$http_proxy
set -euo pipefail

function s () { 
  echo -e $@ 
}

function _() {
	local -n _r=$1
	shift

	echo ${@}
	_r=$(buildah ${@})
	echo $_r
}

function _fl() {
	local -n _r="$1"
	shift
	args=()
	for i in ${!_r[@]}; do
		args+=( --$i=${_r[$i]} )
#		echo -e "\t$i=${_r[$i]}"
	done
	echo ${args[@]} ${@}
	buildah ${args[@]} ${@}
}

packages=( 
node-red-contrib-http-logger
node-red-contrib-boolean-logic
node-red-node-swagger
node-red-contrib-dsm
 node-red-contrib-http-logger
 node-red-node-swagger
 node-red-contrib-sendurl
 node-red-contrib-uibuilder
 node-red-contrib-actionflows
 node-red-contrib-lgtv
 node-red-node-email
 node-red-contrib-boolean-logic
 node-red-contrib-dsm
 node-red-contrib-config
 node-red-contrib-notification-center
)

npm_config=(
#	proxy $http_proxy
#	https-proxy $http_proxy
)

declare -A bcfg
bcfg=(
["cmd"]=/app/node_modules/.bin/node-red

)

_ nc from "clearlinux/node"

_ root mount $nc
_ _ run $nc mkdir /app

_ _ config --workingdir /app $nc
echo "{}" > $root/app/package.json

#set ${npm_config[@]}
#while [[ ${1:-} ]]; do
#	_ _ run $nc npm config -g set $1 $2
#shift 2
#done
_fl bcfg config $nc
_ _ run $nc -- npm install node-red ${packages[@]}

_ _ commit --rm $nc nr
