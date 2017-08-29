#!/bin/bash

#定义函数
echo "=======function definition==============="
function fname1() {
    echo "in function fname1: $@"
}
fname1 1 2 3

fname2() {
    echo "in function fname2: $*"
    echo $@
    echo $1, $2
    return 0;
}
fname2 1 2 3
echo "=======function definition end==============="

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




