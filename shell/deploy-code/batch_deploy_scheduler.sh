#!/bin/sh

# 参数：
# 1 zone_id: 7001, 9001 or all
# 2 setid: set9, set10 or all

# ./batch_deploy_scheduler.sh $zone_id $setid

# steps:
# 1 填充机房信息参数
# 2 生成调用子脚本的参数
# 3 调用脚本
# 4 对服务的检查

if [[ $# -ne 2 ]];then
    echo "eg. $0 \$zone_id \$set_id" >&2
    echo "eg. $0 8001 set9" >&2
    exit 1
 fi


zoneid=$1
setid=$2
instanceid=(0 1)

zone_zk_cluster["666888"]="192.168.153.88:2181,192.168.153.89:2181,192.168.153.90:2181"
zone_set_man_666888_set9_0="192.168.153.51"
zone_set_man_666888_set9_1="192.168.153.44"

zone_zk_cluster["1001"]="172.19.1.2:2181,172.19.1.3:2181,172.19.6.1:2181,172.19.6.2:2181,172.19.6.3:2181,172.19.6.4:2181"
zone_set_man_1001_set9_0="172.19.1.160"
zone_set_man_1001_set9_1="172.19.1.150"

val_zk_cluster=zone_zk_cluster[$zoneid]

for i in "${instanceid[@]}"; do 
    val=zone_set_man_$zoneid"_"$setid"_"$i
    echo ${!val}
    ./deploy_scheduler.sh ${!val_zk_cluster} ${!val} $setid $i
done
