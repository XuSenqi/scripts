#!/bin/bash

#shell中数组相关的用法集合

#数组的定义
#定义方法1
A=(a b c def)
echo ${A[@]}
#定义方法2
B[0]=a
B[1]=b
B[2]=c
B[3]=def
echo ${B[@]}

#数组元素的获取 
echo ${A[@]} //取全部元素, 把每个元素区别对待
echo ${A[*]} //取全部元素, 把每个元素当做整体
echo ${A[0]} //取第0个元素
echo $A      //默认获取第0个元素

#数组个数的获取 
echo ${#A[@]} //取得数组元素的个数
echo ${#A[*]} //取得数组元素的个数
echo ${#A[0]} //取得元素0的长度
echo ${#A[3]} //取得元素3的长度

#赋值
A[3]=yaoshuyin  #将第三个元素重新赋值
echo ${A[@]}

# 切片方式获取一部分数组内容
echo ${A[@]:1:2} // 从第1个元素开始，获取2个元素
echo ${A[@]:2}   // 从第2个元素开始获取元素
echo ${A[@]::2}  // 从第0个元素开始，获取2个元素

# 替换：
echo ${A[*]}
echo ${A[*]/a/A}
echo ${A[*]/b/B}
echo ${A[*]/b/100}

# 元素的打印  
echo -e "\n===========print========="
for i in "${A[@]}"; do
    echo $i
done
for i in "${A[*]}"; do
    echo $i
done
echo "===========print end========="

# bash shell确实有组合两个数组的内置语法
# 这种使用C风格符号+=的方法更简洁，而且写出的代码更清晰。
echo -e "\n===========array += ========="
airsports=( flying gliding parachuting )
A+=("${airsports[@]}")
for ele in "${A[@]}"
do
  echo "Element: $ele"
done
echo "===========array += end ========="

#array的模拟操作
echo -e "\n===========array pop, push, shift, unshift  ========="
new_element=new
#pop:
A=(${A[@]:0:$((${#A[@]}-1))})
echo ${A[@]} #pop
#push:
A=("${A[@]}" $new_element)
echo ${A[@]} #push
#shift:
A=(${A[@]:1})
echo ${A[@]} #shift
#unshift
A=($new_element "${A[@]}")
echo ${A[@]} #unshift
echo "===========array pop, push, shift, unshift end  ========="

unset A  #清除变量
echo ${A[@]}
echo ${#A[@]}  #数组元素个数为0

A=       #清空变量,即将值变为空
echo ${A[@]}
echo ${#A[@]}  #数组元素个数为1

#用shell 实现的选择排序
echo -e "\n===========sort========="
values=(39 5 36 12 9 3 2 30 4 18 22 1 28 25)
numvalues=${#values[@]}

for (( i=0; i < numvalues; i++ )); do
    lowest=$i
    for (( j=i+1; j < numvalues; j++ )); do
        if [ ${values[j]} -le ${values[$lowest]} ]; then
            lowest=$j
        fi
    done
    temp=${values[i]}
    values[i]=${values[lowest]}
    values[lowest]=$temp
done

for (( i=0; i < numvalues; i++ )); do
    echo -ne "${values[$i]}\t"
done
echo -e "\n===========sort end========="

#字符串转数组
echo -e "\n===========string ---> array========="
str="12 34 56"
#arr=($str)用于将字符串$str分割到数组$arr, 默认分隔符为空格 
arr=($str)
count=${#arr[@]}
for (( i=0;i<count;i=i+1))
do
     echo "arr[$i]=${arr[$i]}"
done
echo -e "===========string ---> array end========="

#arr=($a)用于将字符串$a分割到数组$arr ${arr[0]} ${arr[1]} ... 分别存储.
#分割后的数组第1 2 ... 项 ，${arr[@]}项存储整个数组。
#变量$IFS存储着分隔符，这里我们将其设为逗号 "," OLD_IFS用于备份默认的分隔符，使用完后将之恢复默认。
echo -e "\n===========string ---> array========="
a="one,two,three,four"
OLD_IFS="$IFS" 
IFS="," 
arr=($a) 
IFS="$OLD_IFS" 
for s in ${arr[@]} 
do 
    echo "$s" 
done
echo -e "===========string ---> array end========="
