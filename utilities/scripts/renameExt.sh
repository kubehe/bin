#!/usr/bin/env bash
# $1 - suffix to change to $2 recursively

shopt -s globstar

for f in ./**/*.${1}; do
    mv -- "$f" "${f%.${1}}.${2}"
done