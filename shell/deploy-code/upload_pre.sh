#!/bin/sh

#可以做的更智能点：指定机房，set, (或宿主机或管理机)，管理服务名称，可以自己发
#APPS=(uhost-access uhost-manager uhost-scheduler uhost-tracker)
#APPS=(uhost-access)
APPS=(uhost-manager)
for APP in ${APPS[*]}
do
    #./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uhost/$APP root 192.168.153.59 /data/node-framework/node_modules/$APP
    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uhost/$APP root 192.168.153.51 /data/node-framework/node_modules/$APP
done
