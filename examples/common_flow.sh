#!/bin/bash
# 常用的流程：if, case, loop

echo ""
echo "=======if ==============="
yn='y'
# 括号与括号之间，以&&或||来隔开，表示AND或or
if [ "$yn" == "Y" ] || [ "$yn" == "y" ] 
then
    echo "OK, continue"
fi
yn='n'
# 中括号的判断式中，-a, -o, ! 分别表示 与，或，非
if [ "$yn" == "N" -o "$yn" == "n" ]; then
    echo "oh, interrupt"
fi
echo "=======if end ==============="

echo ""
echo "=======case in esac ==============="
cho="yes"
case $cho in
    "yes")
        echo "Your choose is yes!" 
        ;;
    "no")
        echo "Your choose is no!"
        ;; 
    *)
        echo "Your choose is error!" 
        ;;
esac

cho="no"
case $cho in
    "yes" | "no")
        echo "Your choose is yes or no!"
        echo "Your choose is yes or no!"
        ;; 
    *)
        echo "Your choose is error!" 
        ;;
esac
echo "=======case in esac end ==============="

echo ""
echo "=======while do done ==============="
i=1
s=0
while [ $i -le 100 ] 
    #如果变量i的值小于等于100，则执行循环
do
    s=$(( $s+$i ))
    i=$(( $i+1 ))
done 
echo "The sum is: $s" 
echo "=======while do done, end ==============="

echo ""
echo "=======until do done ==============="
i=1
s=0
until [ $i -gt 100 ]
    #循环直到变量i的值大于100，就停止循环 
do
    s=$(( $s+$i )) 
    i=$(( $i+1 )) 
done
echo "The sum is: $s"
echo "=======until do done, end ==============="

echo ""
echo "=======for in  do done ==============="
for time in morning noon afternoon evening
do
    echo "This time is $time!" 
done
echo "=======for in  do done, end ==============="

echo ""
echo "=======for (( )) do done ==============="
s=0
for (( i=1;i<=100;i=i+1 ))
do
    s=$(( $s+$i ))
done
echo "The sum of 1+2+...+100 is : $s"
echo "=======for (( )) do done, end ==============="





