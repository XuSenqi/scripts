#!/bin/bash

function Usage() {
    echo -e "Usage:\n\t$0 -s set_id -i uhost_id -h host_id"
    echo "
        -a set_id, required
        -i uhost_id, required
        -h host_id, required
    "
    echo "example: $0 -s 13 -i uuid -h host_id"
    exit 1
}

declare -A ips
ips[9]="172.23.0.158"
ips[10]="172.23.0.143"
ips[11]="172.23.6.51"
ips[12]="172.23.0.203"
ips[13]="172.23.6.84"
ips[14]="172.23.6.112"
ips[15]="172.23.6.108"
ips[16]="172.23.6.122"
ips[17]="172.23.6.126"
ips[18]="172.23.6.149"
ips[19]="172.23.6.145"
ips[20]="172.23.6.178"
ips[21]="172.23.6.182"
ips[22]="172.23.6.220"
ips[23]="172.23.6.225"
ips[24]="172.23.7.126"
ips[25]="172.23.7.240"
ips[26]="172.23.7.177"
ips[27]="172.23.7.178"
ips[28]="172.23.18.112"
ips[29]="172.23.18.166"
ips[30]="172.23.18.198"

if [ $# -le 3 ]; then
    Usage
fi

while getopts s:i:h: opt; do
    case $opt in
    s)  set_id=$OPTARG;;
    i)  uhost_id=$OPTARG;;
    h)  host_id=$OPTARG;;
    *)  Usage
        exit 1;;
    esac
done

node-tester --host ${ips[$set_id]} --port 8001 --key ucloud.uhost.live_migrate_uhost_with_iscsi_udisk_request -t 50000 uhost_id=$uhost_id host_id=$host_id

