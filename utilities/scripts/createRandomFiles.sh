#!/usr/bin/env bash

path="$1"

numberOfFiles="$2"

echo "path: ${path} number: ${numberOfFiles}"

for i in $(seq 1 ${numberOfFiles}); do
    touch "${path}/$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c6)"
done

