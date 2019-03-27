#!/bin/bash

# 定义一个空map
declare -A map=()

for key in ${!map[@]}
do
    echo $key
done

# --------------
# 定义时初始化map
declare -A map=(["100"]="1" ["200"]="2")

#输出所有key
echo ${!map[@]}

#输出所有value
echo ${map[@]}

#添加值
map["300"]="3"

#输出key对应的值
echo ${map["100"]}

#遍历map
for key in ${!map[@]}
do
    echo ${map[$key]}
done

#查找和删除
#findkey="keyx"
findkey="100"
value="valuex"
if [ ! -n "${map[$findkey]}" ]
then
    map[$findkey]=$value
else
    echo "find value"
    unset map[$findkey]
fi

#遍历map, 全部unset后
for key in ${!map[@]}
do
    echo ${map[$key]}
    unset map[$key]
done

for key in ${!map[@]}
do
    echo ${map[$key]}
done
