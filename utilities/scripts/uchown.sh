#!/usr/bin/env bash

chown $(echo $USER):$(id -gn $USER) ${1} ${2} #? I don't know if there is more elegant solution