#!/usr/bin/env bash

# /pub/FreeBSD/zetis/freebsd-mfs-12.0-CURRENT-amd64.iso
# /pub/Linux/Ubuntu/16.04-amd64-zetis

# global const
ubuntuName="UbuntuGen"
freebsdName="FreeBSDGen"

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case ${key} in
    -f|--freebsd)
    freebsdPath="$2"
    shift
    shift
    ;;
    -u|--ubuntu)
    ubuntuPath="$2"
    shift
    shift
    ;;
    -n|--netinterface)
    netInterface="$2"
    shift
    shift
    ;;
    -s|--shutdown)
    shutdown="true"
    shift
    ;;
    *)
    POSITIONAL+=("$1")
    shift
    ;;
esac
done

set -- "${POSITIONAL[@]}"

echo ${freebsdPath}
echo ${ubuntuPath}

isVirtualBoxAvailable () {
    if which virtualbox >/dev/null;
        then
            return 0
        else
            return 1
    fi
}

createVMachine () {
    local vmName="$1"
    local osType="$2"
    local ram="2048"
    local vram="6"
    local hostAdapter="${netInterface}"

    VBoxManage createvm --name ${vmName} --ostype ${osType} --register
    VBoxManage modifyvm ${vmName} --pae off

    # Create IDE Controller and attach DVD
    VBoxManage storagectl ${vmName} --name "IDE" --add ide
    VBoxManage storageattach ${vmName} --storagectl "IDE" --port 0 \
    --device 0 --type dvddrive --medium $3

    # Set Boot Order
    VBoxManage modifyvm ${vmName} --boot1 dvd --boot2 none --boot3 none --boot4 none

    # Set RAM, VRAM
    VBoxManage modifyvm ${vmName} --memory ${ram} --vram ${vram}

    # Set bridged networking
    VBoxManage modifyvm ${vmName} --nic1 bridged --bridgeadapter1 ${hostAdapter}

    # Set USB Controller
    VBoxManage modifyvm ${vmName} --usb on --usbehci on

    VBoxManage startvm ${vmName} &
}

runBoth () {
    createVMachine ${ubuntuName} "Ubuntu_64" ${ubuntuPath}
    createVMachine ${freebsdName} "FreeBSD_64" ${freebsdPath}
}

installVBoxIfNotExists () {
    if isVirtualBoxAvailable;
        then
            return 0
        else
            sudo apt install virtualbox virtualbox-ext-pack
            installVBoxIfNotExists
    fi
}

isShutdown () {
    if [ "${shutdown}" = "true" ];
        then
            return 0
        else
            return 1
    fi
}

main () {
    installVBoxIfNotExists

    if isShutdown;
        then
            VBoxManage controlvm ${ubuntuName} poweroff
            VBoxManage controlvm ${freebsdName} poweroff
            exit 0
    fi
    runBoth


}

main
exit 0
