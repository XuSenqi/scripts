#!/bin/sh

n=0

while true ; do
    n=$(( $n + 1 ))
    #tcpdump -s 0 -c 102400 -w /tmp/tcpdump/tcpdump.out.$n
    tcpdump -i eth0 ip host 172.30.38.111 -XvvennSs 0 -c 102400 -w /data/tmp/mongo172.30.38.111.cap.$n
done
