#!/bin/bash

pidno=$(ps ax|grep jdsl|awk '{print $1}')
maxmem=51000
echo 'initiating....'

while [ 1!=0 ]
do
size=$(cat /proc/$pidno/status |grep VmSize |awk '{print $2}' |sed 1q)
echo
echo 'Process... '$pidno''
echo 'Size...  '$size''
echo
#b=$(expr $size - $maxmem) 
if  test $size -gt $maxmem 
then
echo "$size larger than $maxmem"
fi
echo 
echo

echo "value of b is  $b"

sleep 2
done
