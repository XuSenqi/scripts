#!/bin/sh

if [[ $# -ne 6 ]];then
    echo "eg. $0 \$user \$src_ip \$file_path \$dst_user \$dst_ip \$dst_dir" >&2
    echo "eg. $0 patrickxu 192.168.150.116 \$file_path root \$dst_ip \$dst_dir" >&2
    echo "eg. $0 patrick.xu \$mac_ip \$file_path root \$dst_ip \$dst_dir" >&2
    exit 1
fi

user=$1
src_ip=$2 #
file_path=$3 #被上传的文件或路径, 文件就拷贝单个文件，目录就将整个目录下的文件拷贝过去
dst_user=$4
dst_ip=$5 #
dst_dir=$6  #目标目录

bak_date=`date +%Y-%m-%d`
bak_time=`date +%H:%M:%S`
cur_dir=`pwd`
date_dir=$cur_dir/$bak_date
project=`basename $file_path`

project_dir="$date_dir"/"$project"
project_time_dir="$date_dir"/"$project""_""$bak_time"
echo $project_dir
echo $project_time_dir

if [ ! -d $date_dir ]; then
  mkdir $date_dir
fi

if [ ! -d $project_time_dir ]; then
  mkdir $project_time_dir
fi

do_download_code( ){
  ssh $user@$src_ip test -d $file_path
  RET=$?                                                                                                                                                                                                                           
  if [ $RET == 0 ]; then
    file_path="$file_path""/*"
  fi

  echo "scp -r $user@$src_ip:$file_path $project_time_dir"
  scp -r $user@$src_ip:$file_path $project_time_dir
}

do_uplode_code( ){
  echo "scp -r $project_time_dir/* $dst_user@$dst_ip:$dst_dir"
  scp -r $project_time_dir/* $dst_user@$dst_ip:$dst_dir
}

#download 代码
do_download_code

#拷贝代码
do_uplode_code

