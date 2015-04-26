#!/bin/bash
#
#  Find out who's logged on any of the clients in skip
#
#HOSTLIST="jabba riker kirk spock worf c3po solo bobafett anakin"
HOSTLIST="jabba bobafett anakin worf c3po solo riker kirk spock"
NOONE="USER"

echo These users are onskip:
echo

for i in $HOSTLIST
do
  ONLIST=$(echo $i | tr a-z A-Z)
  n=$(ssh $i -n w|cut -f 1 -d ' ')
  for j in $n
  do
    if [ $j != $NOONE ]
    then
      ONLIST="${ONLIST}, $j"
#      ONLIST="${ONLIST}($i) "
#      echo adding $i ....
    fi
  done
  echo $ONLIST |sed s/,/\\t/
#  awk '{print $1}'  $ONLIST
  ONLIST=""
done

echo

exit 0
