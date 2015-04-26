#!/bin/bash


COUNTER=0
STRING="usbpkginstaller-1.0.6-i586-2"

BEGIN_OLD=$(echo "Begin old: " $(date))

while [ $COUNTER -lt 10000 ]
  do
  ((COUNTER++))
  RESULT=$(echo $STRING | cut -f 1 -d -)
  echo $RESULT
done

END_OLD=$(echo "End old: " $(date))

BEGIN_NEW=$(echo "Begin new: " $(date))

COUNTER=0

while [ $COUNTER -lt 10000 ]
  do
  ((COUNTER++))
  RESULT=${STRING%%-*}
  echo $RESULT
done

END_NEW=$(echo "End new: " $(date))


echo $BEGIN_OLD
echo $END_OLD
echo $BEGIN_NEW
echo $END_NEW