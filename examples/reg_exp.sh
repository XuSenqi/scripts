#!/bin/bash

# shell script 在if 的判断条件正则表达式=~中引号问题
#1 if的判断条件正则表达式的格式 [[ 变量 =~ 正则表达式 ]]
#2 =~右边的正则表达式不添加引号
#  The =~ Regular Expression match operator no longer requires quoting of the pattern within [[ … ]].
newip='192.168.1.1'
if [[ "$newip" =~ '^([0-9]{1,3}\.){3}[0-9]{1,3}$' ]];then
    echo '111, 找到了ip地址'
fi

if [[ "$newip" =~ ^([0-9]{1,3}.){3}[0-9]{1,3}$ ]];then
    echo '222, 找到了ip地址'
fi

reg='^([0-9]{1,3}.){3}[0-9]{1,3}$'
if [[ "$newip" =~ $reg ]];then
    echo '333, 找到了ip地址'
fi
