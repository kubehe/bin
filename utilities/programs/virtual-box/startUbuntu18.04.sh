#!/usr/bin/env bash
vmExists= $(vboxmanage list vms | grep "IE11 - Win7")
if ( -z ${vmExists} ); then
    VBoxManage import ~/vm/ie11-windows7/IE11\ -\ Win7.ova
fi
nohup VBoxManage startvm "IE11 - Win7" &