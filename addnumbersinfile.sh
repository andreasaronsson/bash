#!/bin/bash

PACKLIST=`cat $1`

for i in $PACKLIST
do
	let "SUM=SUM + $i"
done

echo SUM IS $SUM