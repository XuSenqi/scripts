#!/bin/bash

#Shell中数值的自增
echo "=======numeric add==============="
a=1  
echo $a
a=$(($a+1))  
echo $a
a=$[$a+1]  
echo $a
a=`expr $a + 1`  
echo $a
let a++  
echo $a
let a+=1 
echo $a
echo "=======numeric add, end==============="

