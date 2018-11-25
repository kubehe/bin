#!/usr/bin/expect -f

set host [lindex $argv 0]
set password [lindex $argv 1]
set script [lindex $argv 2]

spawn scp "./$script" "$host:~/$script"
expect "Password:"
send "$password\r"
interact

set timeout 10000

