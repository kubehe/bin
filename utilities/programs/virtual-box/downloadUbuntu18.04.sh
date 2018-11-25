#!/usr/bin/env bash

mkdir -p ~/vm/ubuntu1804 && cd ~/vm/ubuntu1804
# this is vdi, find ova
curl 'https://vorboss.dl.sourceforge.net/project/osboxes/v/vb/55-U-u/18.04/1804164.7z' -H 'Connection: keep-alive' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' -H 'Upgrade-Insecure-Requests: 1' -H 'DNT: 1' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/69.0.3497.81 Chrome/69.0.3497.81 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' -H 'Referer: https://sourceforge.net/projects/osboxes/files/v/vb/55-U-u/18.04/1804164.7z/download' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-GB,en-US;q=0.9,en;q=0.8,pl;q=0.7,de;q=0.6' -H 'Cookie: eupubconsent=BOXxAtyOXxAtyAKALAENAAAA-AAAAA' --compressed --output ubuntu18.04.7z
p7zip -d ubuntu18.04.7z
rm ubuntu18.04.7z