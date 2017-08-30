#!/bin/bash
# shell函数中不存在前向声明，必须先定义函数，再调用该函数

#语法
#[ function ] funname [()]
#{
#    action;
#    [return int;]
#}
#说明：
#1、可以带function fun()  定义，也可以直接fun() 定义,不带任何参数。
#2、参数返回，可以显示加：return返回，如果不加，将以最后一条命令运行结果，作为返回值。return后跟数值n(0-255)

#定义函数
echo "=======function definition==============="
function fname1() {
    echo "in function fname1: $@"
}
fname1 1 2 3

fname2() {
    #echo "in function fname2: $*"
    #echo $@
    #echo $1, $2
    return 0;   #返回范围是[0~255]
    #return -1; #return: -1: invalid option
    #return 257;# return 256, 实际返回0；return 257, 实际返回1
}
fname2 1 2 3
echo "=======function definition end==============="

# 函数中的return 或者 echo 或者 存在一个变量中
echo ""
echo "=======函数中返回值或者变量的接收 ==============="

# 使用$?来接收上一程序的返回值状态，也就是return返回的值。
# 如果在函数里没有使用return命令指定一个返回值，函数返回的就是执行的最后一条命令的退出码
echo "=======return, 使用\$?来接收 ==============="
fret() {
    ls 
    return 5;   #返回范围是[0~255]
}
fret
ret=$?
echo "\$?: "$ret
echo "=======return, 使用\$?来接收, end ==============="

# 使用echo语句，将结果输出到标准输出上，所以在主程序中可以使用变量接收 
echo "=======echo出的字符串用变量来接收 ==============="
fecho() {
    echo "result"
}
res=$(fecho)
echo "res: "$res
echo "=======echo出的字符串用变量来接收, end ==============="

# 让函数将结果保存在一个变量中，该变量然后可以在函数结束之后被使用 
echo "=======让函数将结果保存在一个变量中 ==============="
fecho() {
    last_user=$(cat /etc/passwd | cut -d ":" -f 1 | tail -n 1)
}
fecho
echo "last_user: "$last_user
echo "=======让函数将结果保存在一个变量中, end ==============="
echo "=======函数中返回值或者变量的接收 end==============="

# 函数内的局部变量，使用local关键字，仅限作用于函数的范围内 
echo "=======local variable==============="
sample_text="global variable"
foo() {
    local sample_text="local variable"
    echo "Function foo is executing"
    echo $sample_text
}
echo $sample_text
foo
echo $sample_text
echo "=======local variable, end==============="

# $@ 和 $* 的区别
# $@ 代表所有参数，每个参数看成独立的
# $* 代表所有参数，所有参数看成一个整体
echo ""
echo "=======the difference between $@ and $*==============="
function diff() {
    echo "in function diff: $@, $*"
    echo "\"\$@\""
    for i in "$@"
    do
        echo "The parameter is $i"
    done
    echo "\$@"
    for i in $@
    do
        echo "The parameter is $i"
    done

    echo "\"\$*\""
    for i in "$*"
    do
        echo "The parameter is $i"
    done
    echo "\$*"
    for i in $*
    do
        echo "The parameter is $i"
    done
}
diff 1 2 3
echo "=======the difference between $@ and $* end ==============="




