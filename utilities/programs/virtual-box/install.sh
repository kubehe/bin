#!/usr/bin/env bash

isVirtualBoxAvailable () {
    if which virtualbox >/dev/null;
        then
            return 0
        else
            return 1
    fi
}

installVBoxIfNotExists () {
    if isVirtualBoxAvailable;
        then
            return 0
        else
            sudo apt install virtualbox virtualbox-ext-pack
    fi
}

main () {
    installVBoxIfNotExists
}

main
exit 0
