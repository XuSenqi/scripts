#!/bin/bash

#shell中数组相关的用法集合

#用shell 实现的选择排序
echo -e "\n===========sort========="
values=(39 5 36 12 9 3 2 30 4 18 22 1 28 25)
numvalues=${#values[@]}

for (( i=0; i<$numvalues; i++ )); do
    echo -ne "${values[$i]}\t"
done

cho="no"
case $cho in
    "yes" | "no")
        echo "Your choose is yes or  no!"
        ;; 
    *)
        echo "Your choose is error!" 
        ;;
esac
