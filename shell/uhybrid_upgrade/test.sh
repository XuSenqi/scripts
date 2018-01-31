#!/bin/bash 

password=xusenqi

expect -c "
    set timeout 10;
    spawn ssh xusenqi@192.168.8.138 -p 22;
    expect {
        *assword* { send \"$password\r\"}
    };
    expect xusenqi@* { send \"ls -l\r\" };
    expect xusenqi@* { send exit\r };
    expect 100% ;
"
