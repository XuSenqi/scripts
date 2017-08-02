#!/bin/sh

if [[ $# -ne 4 ]];then
    echo "eg. $0 \$vm_type \$dest_ip \$project \$branch" >&2
    exit 1
fi

vm_type=$1 #man or host
dest_ip=$2 #被更新代码的机器的IP
project=$3 #代码库的project
branch=$4  #代码库的分支

bak_date=`date +%Y-%m-%d`
bak_time=`date +%H:%M`
cur_dir=`pwd`
date_dir=$cur_dir/$bak_date

project_dir="$date_dir"/"$project"
project_time_dir="$date_dir"/"$project""_""$bak_time"
echo $project_dir
echo $project_time_dir

if [ ! -d $date_dir ]; then
  mkdir $date_dir
fi

do_git_clone( ){
  cd $date_dir
  if [ "$project" == "uhost" ];then
      repo="git@gitlab.ucloudadmin.com:uhost/uhost.git"
  elif [ "$project" == "uimage3" ];then
      repo="git@gitlab.ucloudadmin.com:uhost/uimage3.git"
  elif [ "$project" == "uimage3-action-scripts" ];then
      repo="git@gitlab.ucloudadmin.com:uhost/uimage3-action-scripts.git"
  else
      echo "project not in (uhost, uimage3, uimage3-action-scripts.git), not allowed to git clone !!!"
      echo "eg. $0 \$dest_ip \$project \$branch" >&2
      exit 1
  fi

  git clone $repo
  if [[ $? -ne 0 ]];then
      echo "git clone error:!!! git clone $repo"
      exit 1
  fi

  mv $project_dir $project_time_dir
  cd $project_time_dir
  git checkout $branch
  if [[ $? -ne 0 ]];then
      echo "This branch $branch not exist in $project!!!"
      exit 1
  fi
}

do_uplode_code( ){
  cd $project_time_dir
  if [ "$vm_type" == "man" ];then
      code_dir="/data/node-framework/node_modules"
  elif [ "$vm_type" == "host" ];then
      if [ "$project" == "uimage3-action-scripts" ];then
          code_dir="/root/node-framework/node_modules/uimage3-action/scripts"
      else
          code_dir="/root/node-framework/node_modules"
      fi
  else
      echo "vm_type not in (man, host), not allowed to upload !!!"
      exit 1
  fi


  echo "scp -r $project_time_dir/* root@$dest_ip:$code_dir"
  scp -r $project_time_dir/* root@$dest_ip:$code_dir

  if [[ $? -ne 0 ]];then
      echo "scp error:!!! scp -r * root@$dest_ip:$code_dir"
      exit 1
  fi
}

#clone 代码
do_git_clone

#拷贝代码
do_uplode_code
