#!/usr/bin/env bash

# const 
osVersion=$(uname)

setInterfaces () {
	if [ "${osVersion}" = "Linux" ]; then
		sudo ip link add name br0 type bridge
		sudo ip tuntap add name tap0 mode tap
		sudo ip link set dev tap0 up
		sudo ip link set tap0 master br0
		sudo ip link set em0 master bro

		echo "----------"
		echo $(ip link)


	elif [ "${osVersion}" = "FreeBsd" ]; then
		ifconfig bridge create
		ifconfig tap create
		ifconfig tap0 up
		ifconfig bridge0 addm tap0 addm em0

		echo "----------"
		echo $(ifconfig)
	else
		echo "system not supported: ${osVersion}"
		exit 1
	fi
	exit 0
}

destroyInterfaces () {
	if [ "${osVersion}" = "Linux" ]; then
		sudo ip link set dev tap0 down
		sudo ip tuntap del name tap0 mode tap
		sudo ip link set dev br0 down
		sudo ip link set em0 nomaster
		sudo ip link del name br0 mode bridge

	elif [ "${osVersion}" = "FreeBsd" ]; then
		ifconfig tap0 destroy
		ifconfig bridge0 destroy
	else
		echo "system not supported: ${osVersion}"
		exit 1
	fi
	exit 0
}

POSITIONAL=()
while [[ $# -gt 0 ]]
do	
key="$1"
case ${key} in 
	-s|--setup)
	setInterfaces
	shift
	;;
	-d|--destroy)
	destroyInterfaces
	shift
	;;
	*)
	POSITIONAL+=("$1")
	shift
	;;
esac
done

set -- "${POSITIONAL[@]}"

