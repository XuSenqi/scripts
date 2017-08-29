#!/bin/bash

#Shell中字符串分割的方法
echo "=======string split methods==============="
# 1 shell用字符串中的空格（或者替换成空格），来分割
echo "=======string split using blank==============="
var='1,2,3,4,5'  
echo $var
var=${var//,/ }    #这里是将var中所有的,替换为空格  
echo $var
for element in $var   
do  
    echo $element  
done  
echo "=======string split using blank, end==============="

# 2 arr=($a)用于将字符串$a分割到数组$arr ${arr[0]} ${arr[1]} ... 分别存储.
#分割后的数组第1 2 ... 项 ，${arr[@]}项存储整个数组。
#变量$IFS存储着分隔符，这里我们将其设为逗号 "," OLD_IFS用于备份默认的分隔符，使用完后将之恢复默认。
echo -e "\n===========string split to array using arr=($a)========="
a="one,two,three,four"
OLD_IFS="$IFS" 
IFS="," 
arr=($a) 
IFS="$OLD_IFS" 
for s in ${arr[@]} 
do 
    echo "$s" 
done
echo -e "\n===========string split to array using arr=($a) end========="

# 3 shell用awk分割字符串  
echo ""
echo "=======string split to arr using awk==============="
myline="People Man,www.people.com, human"
string_split_awk() {
    str=$1
    sepa=$2
    i=1
    #while [ 1 == 1 ]
    while true
    do
        split=`echo $str | cut -d $sepa -f $i`  
        #split=`echo $str | cut -d $sepa -f $i | tr -d ' '`   #删除了空格
        if [ "x$split" != "x" ]  
        then  
            myline_arr[$(($i-1))]=$split
            i=$(($i+1))  
        else  
            break  
        fi  
    done
}
string_split_awk "$myline" ','
num=${#myline_arr[@]}
for (( i=0; i<$num; i=i+1 ))
do
    echo ${myline_arr[$i] }
done
#for s in ${myline_arr[@]}  #注意：会把 "People Man"作为2个元素输出，因为有空格 
#do 
#    echo "$s" 
#done
echo "=======string split to arr using awk end==============="

echo ""
echo "=======string length==============="
str="hello"
len=${#str}
echo "$str,  $len"
echo "=======string length len==============="
