#!/usr/bin/env bash

mkdir --parents ~/vm/ie11-windows7 && cd ~/vm/ie11-windows7
wget --continue --input-file https://github.com/magnetikonline/linuxmicrosoftievirtualmachines/raw/master/vmarchiveset/ie11-windows7.txt
unzip IE11.Win7.VirtualBox.zip
rm IE11.Win7.VirtualBox.zip