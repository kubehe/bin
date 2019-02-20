#!/usr/bin/env bash

mkdir ~/{Projects,tmp}
chown $(echo $USER):$(id -gn $USER) ~/Projects ~/tmp #? I don't know if there is more elegant solution

