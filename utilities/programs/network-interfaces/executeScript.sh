#!/usr/bin/expect -f

set host [lindex $argv 0]
set password [lindex $argv 1]
set script [lindex $argv 2]

spawn ssh $host
expect "Password:"
send "$password\r"
expect "\r"
spawn "./$script"
interact

set timeout 10000
