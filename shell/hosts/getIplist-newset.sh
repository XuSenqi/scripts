file=newset
for ip in `cat $file|awk '{print $3}'`
do
idc=`cat $file | grep -w $ip | awk '{print $1}'`
set=`cat $file | grep -w $ip | awk '{print $2}'`
node-tester --host $ip --port 8301 --key ucloud.uhost.get_host_resource_request |grep 'state: HOST_ONLINE\|state: HOST_LOCKED' -A 3 |grep ip |awk -F [:\"] '{print $3}' > "$idc"_"$set"
done
