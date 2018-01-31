#!/bin/sh

#可以做的更智能点：指定机房，set, (或宿主机或管理机)，管理服务名称，可以自己发

#APPS=(uhost-action)
APPS=(uhost-monitor)
for APP in ${APPS[*]}
do
    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uhost/$APP root 172.25.9.110 /root/node-framework/node_modules/$APP
done
