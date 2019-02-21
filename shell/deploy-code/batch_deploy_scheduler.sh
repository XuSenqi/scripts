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

zone_zk_cluster["1001"]="172.19.6.1:2181,172.19.6.2:2181,172.19.6.3:2181,172.19.6.4:2181,172.19.1.208:2181"
zone_set_man_1001_set9_0="172.19.1.160"
zone_set_man_1001_set9_1="172.19.1.150"

zone_zk_cluster["3001"]="172.26.0.77:2181,172.26.0.78:2181,172.26.0.79:2181,172.26.0.80:2181,172.26.0.81:2181"
zone_set_man_3001_set9_0="172.26.6.2"
zone_set_man_3001_set9_1="172.26.6.6"
zone_set_man_3001_set10_0="172.26.6.28"
zone_set_man_3001_set10_1="172.26.6.35"
zone_set_man_3001_set11_0="172.26.6.105"
zone_set_man_3001_set11_1="172.26.6.107"
zone_set_man_3001_set14_0="172.26.17.36"
zone_set_man_3001_set14_1="172.26.17.37"
zone_set_man_3001_set15_0="172.26.17.90"
zone_set_man_3001_set15_1="172.26.17.91"

zone_zk_cluster["8100"]="172.28.37.106:2181,172.28.37.107:2181,172.28.37.108:2181,172.28.37.109:2181,172.28.37.110:2181"
zone_set_man_8100_set9_0="172.28.38.132"
zone_set_man_8100_set9_1="172.28.38.133"
zone_set_man_8100_set10_0="172.28.38.116"
zone_set_man_8100_set10_1="172.28.38.117"
zone_set_man_8100_set11_0="172.28.38.108"
zone_set_man_8100_set11_1="172.28.38.109"
zone_set_man_8100_set15_0="172.28.39.35"
zone_set_man_8100_set15_1="172.28.39.38"

zone_zk_cluster["8200"]="172.18.37.105:2181,172.18.37.106:2181,172.18.37.107:2181,172.18.37.108:2181,172.18.37.109:2181"
zone_set_man_8200_set9_0="172.18.37.125"
zone_set_man_8200_set9_1="172.18.37.126"
zone_set_man_8200_set10_0="172.18.37.134"
zone_set_man_8200_set10_1="172.18.37.135"
zone_set_man_8200_set11_0="172.18.37.142"
zone_set_man_8200_set11_1="172.18.37.143"
zone_set_man_8200_set12_0="172.18.37.150"
zone_set_man_8200_set12_1="172.18.37.151"
zone_set_man_8200_set15_0="172.18.38.108"
zone_set_man_8200_set15_1="172.18.38.109"
zone_set_man_8200_set16_0="172.18.38.120"
zone_set_man_8200_set16_1="172.18.38.121"
zone_set_man_8200_set17_0="172.18.38.136"
zone_set_man_8200_set17_1="172.18.38.137"
zone_set_man_8200_set18_0="172.18.38.199"
zone_set_man_8200_set18_1="172.18.38.200"
zone_set_man_8200_set19_0="172.18.39.156"
zone_set_man_8200_set19_1="172.18.39.157"
zone_set_man_8200_set20_0="172.18.39.168"
zone_set_man_8200_set20_1="172.18.39.169"


zone_zk_cluster["8300"]="172.20.180.36:2181,172.20.180.37:2181,172.20.176.42:2181,172.20.176.41:2181,172.20.176.40:2181"
zone_set_man_8300_set9_0="172.20.180.90"
zone_set_man_8300_set9_1="172.20.176.130"
zone_set_man_8300_set10_0="172.20.176.147"
zone_set_man_8300_set10_1="172.20.176.148"
zone_set_man_8300_set12_0="172.20.181.20"
zone_set_man_8300_set12_1="172.20.181.21"

zone_zk_cluster["110100"]="172.29.45.125:2181,172.29.45.191:2181,172.29.45.205:2181,172.29.45.217:2181,172.29.45.231:2181"
zone_set_man_110100_set9_0="172.29.45.116"
zone_set_man_110100_set9_1="172.29.45.127"
zone_set_man_110100_set10_0="172.29.45.21"
zone_set_man_110100_set10_1="172.29.45.22"

zone_zk_cluster["110200"]="172.20.12.111:2181,172.20.12.112:2181,172.20.12.113:2181,172.20.12.114:2181,172.20.12.115:2181"
zone_set_man_110200_set9_0="172.20.12.43"
zone_set_man_110200_set9_1="172.20.12.44"
zone_set_man_110200_set11_0="172.20.12.182"
zone_set_man_110200_set11_1="172.20.12.184"
zone_set_man_110200_set12_0="172.20.12.220"
zone_set_man_110200_set12_1="172.20.12.221"
zone_set_man_110200_set13_0="172.20.12.247"
zone_set_man_110200_set13_1="172.20.12.248"
zone_set_man_110200_set14_0="172.20.13.60"
zone_set_man_110200_set14_1="172.20.13.61"
zone_set_man_110200_set15_0="172.20.13.62"
zone_set_man_110200_set15_1="172.20.13.63"

val_zk_cluster=zone_zk_cluster[$zoneid]

for i in "${instanceid[@]}"; do 
    val=zone_set_man_$zoneid"_"$setid"_"$i
    echo ${!val}
    ./deploy_scheduler.sh ${!val_zk_cluster} ${!val} $setid $i
done
