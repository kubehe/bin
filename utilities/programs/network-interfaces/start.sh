#!/usr/bin/env bash
cd ~/bin/BashScripts/NetworkInterfaces

kunHomeVersion () {
	nohup ./vBoxCreator.sh -n wlo1 -f /home/kubehe/Downloads/freebsd-mfs-12.0-CURRENT-amd64.iso -u /home/kubehe/Downloads/debian-live-9.4.0-amd64-xfce+nonfree.iso &
}

runDevVersion () {
	nohup ./vBoxCreator.sh -n em0 -f /pub/FreeBSD/zetis/freebsd-mfs-12.0-CURRENT-amd64.iso -u /pub/Linux/Ubuntu/16.04-amd64-zetis &

	sleep 30s
	./scriptExecutor -l root -p zetis -h $(VBoxManage guestproperty enumerate "UbuntuGen" | grep IP)
	./scriptExecutor -l root -p zetis -h $(VBoxManage guestproperty enumerate "FreeBSDGen" | grep IP)
}

POSITIONAL=()
while [[ $# -gt 0 ]] 
do
	key="$1"
	case ${key} in 
		-h|--home)
		runHomeVersion
		shift
		;;
		-d|--dev)
		runDevVersion
		shift
		;;
		-t|--timeforvm)
		time=(${2})
		shift
		shift
		;;
		*)
		POSITIONAL+=("$1")
		shift
		;;
	esac
done

set -- "${POSITIONAL[@]}"

exit 0
