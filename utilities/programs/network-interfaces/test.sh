#!/usr/bin/env bash

isVirtualBoxAvailable () {
    if which virtualbox >/dev/null; then
        return 0
    else
        return 1
    fi
}

if isVirtualBoxAvailable; then echo "true"; else echo "false"; fi
