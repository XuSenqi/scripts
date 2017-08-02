#!/bin/sh

#可以做的更智能点：指定机房，set, (或宿主机或管理机)，管理服务名称，可以自己发
APPS=(uhost-access uhost-scheduler uhost-manager)
#APPS=(uhost-access)
for APP in ${APPS[*]}
do
    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uhost/$APP root 172.23.7.126 /data/node-framework/node_modules/$APP
    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uhost/$APP root 172.23.7.131 /data/node-framework/node_modules/$APP
done

#APPS=(uimage3-access uimage3-manager)
#APPS=(uimage3-access)
#for APP in ${APPS[*]}
#do
#    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uimage3/$APP root 172.18.37.150 /data/node-framework/node_modules/$APP
#    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uimage3/$APP root 172.18.37.151 /data/node-framework/node_modules/$APP
#done

#APPS=(uhost-action)
#for APP in ${APPS[*]}
#do
##    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uhost/$APP root 172.27.162.108 /root/node-framework/node_modules/$APP
#    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uhost/$APP root 172.27.168.230 /root/node-framework/node_modules/$APP
#    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uhost/$APP root 172.27.172.226 /root/node-framework/node_modules/$APP
#done

#APPS=(uimage3-action)
#for APP in ${APPS[*]}
#do
#    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uimage3/$APP root 172.27.168.230 /root/node-framework/node_modules/$APP
#    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uimage3/$APP root 172.27.172.226 /root/node-framework/node_modules/$APP
#done

#APPS=(uimage3-action-scripts)
#for APP in ${APPS[*]}
#do
#    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uimage3-action-scripts root 172.27.168.230 /root/node-framework/node_modules/uimage3-action/scripts
#    ./upload.sh patrickxu 192.168.150.116 /data/Patrick.Xu/uimage3-action-scripts root 172.27.172.226 /root/node-framework/node_modules/uimage3-action/scripts
#done

