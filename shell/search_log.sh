#!/bin/bash

function Usage() {
    echo -e "Usage:\n\t$0 -a api -d date [-R Retcode ] [-e email] [-p policy]"
    echo "
        -a api, required
        -d date to serach, like 2017042718 or  20170427*, required
        -R Retcode of api, like 8060, 8039, optional
        -e email: like 961333463@qq.com or qq, optional
        -p policy: like (stable|gray|recycle|resize|gray3|tm|all), default stable, optional
    "
    echo "example: $0 -a CreateUHost -d 2017051305 -R 8060 -e qq "
    exit 1
}

judge(){
	result=$1
	ip=$2
	dir=$3
	if [ "$result" != "" ]
	then
		echo "=================================================="
		echo $ip	$dir
		echo "=================================================="
		echo "$result"
		echo "=================================================="
		#exit 0
	fi
}

get_result(){
	ip=$1
	dir=$2
        cmd="grep -n $api api-gateway.$date -A 2"
        if [ "$email" != "" ]; then
            cmd=${cmd}" | grep $email -A 2"
        fi
        if [ "$Retcode" != "" ]; then
            cmd=${cmd}" | grep $Retcode"
        fi
        
	echo "ssh root@$ip cd $dir; $cmd"
	result=`ssh root@$ip "cd $dir; $cmd"`
	judge "$result" $ip $dir
}

ips=(
172.18.38.32
172.18.38.33
172.28.246.215
172.28.246.216
172.27.119.75
172.27.119.76
172.26.6.243
172.26.6.244
172.25.6.87
172.25.6.88
172.28.227.93
172.28.227.94
)

stable="/data/uhost-api-git/logs"
gray="/data/uhost-api-gray/vpc2_gray/logs"
zone="/data/uhost-api-gray/uhost-api-resize/"
describe="/data/uhost-api-gray/uhost-api-tm/logs"
recycle="/data/uhost-api-gray/uhost-api-recycle/logs"
gray3="/data/uhost-api-gray/uhost-api-gray3/logs"

if [ $# -le 2 ]; then
    Usage
fi

while getopts a:d:R:e:p: opt; do
    case $opt in
    a)  api=$OPTARG;;
    d)  date=$OPTARG;;
    R)  Retcode=$OPTARG;;
    e)  email=$OPTARG;;
    p)  policy=$OPTARG;;
    *)  Usage
        exit 1;;
    esac
done

declare -A APIs
APIs[stable]=$stable
APIs[gray]=$gray
APIs[zone]=$zone
APIs[describe]=$describe
APIs[recycle]=$recycle
APIs[gray3]=$gray3

if [ "$policy" == "" ]
then
	policy="stable"
fi

for ip in ${ips[@]}
do 
	if [ "$policy" == "all" ]
	then
		for dir in ${APIs[@]}
		do
			get_result $ip $dir
		done
	else
		dir=${APIs[$policy]}
		get_result $ip $dir
	fi
done
