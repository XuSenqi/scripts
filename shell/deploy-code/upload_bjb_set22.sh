#!/bin/sh

#可以做的更智能点：指定机房，set, (或宿主机或管理机)，管理服务名称，可以自己发
APPS=(uhost-access uhost-manager uhost-scheduler uhost-tracker)
#APPS=(uhost-access)
for APP in ${APPS[*]}
do
    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uhost/$APP root 172.27.247.171 /data/node-framework/node_modules/$APP
    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uhost/$APP root 172.27.247.174 /data/node-framework/node_modules/$APP
done

APPS=(uimage3-access uimage3-manager)
#APPS=(uimage3-access)
for APP in ${APPS[*]}
do
    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uimage3/$APP root 172.27.247.171 /data/node-framework/node_modules/$APP
    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uimage3/$APP root 172.27.247.174 /data/node-framework/node_modules/$APP
done

APPS=(uhost-action)
for APP in ${APPS[*]}
do
    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uhost/$APP root 172.27.174.98 /root/node-framework/node_modules/$APP
    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uhost/$APP root 172.27.174.99 /root/node-framework/node_modules/$APP
    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uhost/$APP root 172.27.174.100 /root/node-framework/node_modules/$APP
done

APPS=(uimage3-action)
for APP in ${APPS[*]}
do
    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uimage3/$APP root 172.27.174.98 /root/node-framework/node_modules/$APP
    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uimage3/$APP root 172.27.174.99 /root/node-framework/node_modules/$APP
    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uimage3/$APP root 172.27.174.100 /root/node-framework/node_modules/$APP
done

