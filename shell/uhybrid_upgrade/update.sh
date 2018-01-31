#!/bin/bash

obj_branch="* master"
echo "obj_branch = $obj_branch"

cd /data/Patrick.Xu/message
current_branch="$(git branch | grep "*")"
echo "/data/Patrick.Xu/message: current_branch = $current_branch"

if [ "$current_branch" != "$obj_branch" ] 
    then 
       echo "/data/Patrick.Xu/message: current_branch != obj_branch"   
       exit 1
fi

cd /data/Patrick.Xu/uhpc/access
current_branch="$(git branch | grep "*")"
echo "/data/Patrick.Xu/uhpc/access: current_branch = $current_branch"

if [ "$current_branch" != "$obj_branch" ] 
    then 
       echo "/data/Patrick.Xu/uhpc/access: current_branch != obj_branch"   
       exit 1
fi

echo "*********************make message************************************"
cd /data/Patrick.Xu/message
make clean
make 

VERSION="$(cat Makefile | grep ^VERSION | awk '{print $3}')" 
APP="$(cat Makefile | grep ^APP | awk '{print $3}')" 
DESC_APP="$(cat Makefile | grep ^DESC_APP | awk '{print $3}')" 
TARGET_NAME=libmessage.so.$VERSION
DESC_NAME=umessage.desc.$VERSION
SOURCE_TARGET_NAME="/data/Patrick.Xu/wiwo/libs/$TARGET_NAME"

echo "TARGET_NAME = $TARGET_NAME"
echo "DESC_NAME = $DESC_NAME"

cd ~/wiwo/libs
pwd

if [ -e "$TARGET_NAME" ] 
    then
        echo "$TARGET_NAME exists"
    else
        echo "$TARGET_NAME not exists"
        exit 2
fi

if [ -e $DESC_NAME ] 
    then
        echo "$DESC_NAME exists"
    else
        echo "$DESC_NAME not exists"
    exit 3
fi

echo "*********************make access.so************************************"
cd /data/Patrick.Xu/uhpc/access
make clean
make

if [ -e access.so ] 
    then
        echo "access.so exists"
    else
        echo "access.so not exists"
        exit 4
fi

sudo ldconfig

current_target_name="$(ldd access.so | grep libmessage.so.$VERSION | awk '{print $1}')"
echo "current_target_name = $current_target_name"
if [ "$current_target_name" != "$TARGET_NAME" ] 
    then 
       echo "/data/Patrick.Xu/uhpc/access: current_target_name != TARGET_NAME"   
       exit 5
fi

current_source_target_name="$(ldd access.so | grep libmessage.so.$VERSION | awk '{print $3}')"
echo "current_source_target_name = $current_source_target_name"
if [ "$current_source_target_name" != "$SOURCE_TARGET_NAME" ] 
    then 
       echo "/data/Patrick.Xu/uhpc/access: current_source_target_name != SOURCE_TARGET_NAME"   
       exit 6
fi

cd /data/Patrick.Xu/myscript
./public.sh access j Patrick.Xu patrick.xu


