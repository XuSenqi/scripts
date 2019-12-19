#!/bin/bash
IP_file='./ip.txt'
if [ -e  "$IP_file" ]　　　　　　　　　　#检查ip.txt文件是否存在，
then
    echo -e "\033[1;32;40m IP file is exist \033[0m" 
else 
    echo -e "\033[1;31;40m IP file is not exist \033[0m"
    exit 2
fi
for i in $(cat ${IP_file})
do 
    IP=$(echo "${i}" |awk -F":" '{print $1}')  #将ip.txt每行的ip值获取
    PW=$(echo "${i}" |awk -F":" '{print $2}')#将ip.txt每行的ip值获取
　　./ssh_copy.exp $IP $PW 
　　if [ $? -eq 0 ] #判断expect脚本是否执行成功
　　then 
　　　　echo "$IP add is ok " 
　　else 
　　　　echo "$IP add faile" 
　　fi 
done
