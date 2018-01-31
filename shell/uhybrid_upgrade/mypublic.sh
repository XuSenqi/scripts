#!/bin/bash
bak_date=`date +%Y-%m-%d`
filepath=/data/$3/uhpc/$1/$1.so

user=xusenqi
password=xusenqi

echo 'check so...'
ls $filepath >/dev/null 2>&1
if [ "$?" -gt 0 ]; then
        echo "so file not exist in $filepath"
else
for natip in `cat $2`
do  
    echo "开始安装$natip uhpc $i..."

    #mkdir 201X-xx-xx
    expect -c "
        set timeout 10;
        spawn ssh $user@$natip -p 22;
        expect {
            *assword* { send \"$password\r\"}
        };
        expect $user@* { send \"mkdir -p /data/$4/uhpc/$1/$bak_date\r\" };
        expect $user@* { send exit\r };
        expect 100% ;
    "

    #上传access.so到跳板机
    expect -c "
        set timeout 10;
        spawn scp $filepath $4@$natip:/data/$4/uhpc/$1/$bak_date/
        expect {
            *assword* { send \"$password\r\"}
        };
        expect 100% ;
    "

done
fi

#for natip in `cat $2`
#do
#    #跳板机上上传access.so到服务器
#    echo "开始上传access.so到服务器..."
#    expect -c "
#        set timeout 10;
#        spawn ssh $user@$natip -p 22;
#        expect {
#            *assword* { send \"$password\r\"}
#        };
#        expect $user@* { send \"cd /data/$user/uhpc\r\" };
#        expect $user@* { send \"./public.sh access uhpc_man\r\" };
#        expect $user@* { send exit\r };
#        expect 100% ;
#    "
#    
#done
#fi

