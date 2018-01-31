#!/bin/sh
bak_date=`date +%Y-%m-%d`
filepath=/data/$3/uhpc/$1/$1.so
echo 'check so...'
ls $filepath >/dev/null 2>&1
if [ "$?" -gt 0 ]; then
        echo "so file not exist in $filepath"
else
for natip in `cat $2`
do  
    echo "开始安装$natip uhpc $i..."
    #ssh $4@$natip mkdir -p /data/$4/uhpc/$1/$bak_date
    scp $filepath $4@$natip:/data/$4/uhpc/$1/$bak_date/
done
fi
