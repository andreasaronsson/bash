#!/bin/bash

for fname in * 
do
  n=$(echo $fname | tr A-Z a-z)
  if [ "$fname" !=  "$n"  ]
  then
  mv "$fname" "$n"
  fi
done

FOUND=0

for fname in *    #Traverse all files in directory
do
if [ `echo "$fname" | grep -c ' '` -gt $FOUND ]   #check for spaces
then
n=$(echo $fname | sed -e 's/ /_/g')  # Substitute underscore for blank
mv "$fname" "$n"            # Do the actual renaming
fi
done 
exit 0