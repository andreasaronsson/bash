#!/bin/bash

RANGE=11
lvl=1
ettnoll=2
string="0"
ladd=0
rm -f testmatr

echo $string

maxlvl=$RANDOM
let "maxlvl %= $RANGE"
while [ "$maxlvl" -lt "$lvl" ]
  do
  maxlvl=$RANDOM
  let "maxlvl %= $RANGE"
done
maxrow=$RANDOM
let "maxrow %= $RANGE"
while [ "$maxrow" -lt "$ettnoll" ]
  do
  maxrow=$RANDOM
  let "maxrow %= $RANGE"
done
maxcol=$RANDOM
let "maxcol %= $RANGE"
while [ "$maxcol" -lt "$ettnoll" ]
  do
  maxcol=$RANDOM
  let "maxcol %= $RANGE"
done

echo
echo "Generating matrixfile..."
echo "maxlvl $maxlvl"
echo "maxcol $maxcol"
echo "maxrow $maxrow"
echo "-----------------"
while [ "$lvl" -le $maxlvl ]  
do
  row=1
  while [ "$row" -le $maxrow ]
  do
    col=1
    while [ "$col" -le $maxcol ]
      do
      number=$RANDOM
      let "number %= $ettnoll"
      if [ "$row" -eq $maxrow ]
	  then
	  if [ "$ladd" -eq 0 ]
	      then
	      string="${string}>"
	      let "ladd += 1"
	  else
	      string="${string}$number"
	  fi
      else
	  string="${string}$number"
      fi
      let "col += 1" 
    done
    echo $string >> testmatr
    string="0"
    let "row += 1"
  done
  if [ ! "$lvl" -eq $maxlvl ]
      then
      echo "#" >> testmatr
      ladd=0
  fi
  let "lvl += 1"
  maxrow=$RANDOM
  let "maxrow %= $RANGE"
  while [ "$maxrow" -lt "$ettnoll" ]
    do
    maxrow=$RANDOM
    let "maxrow %= $RANGE"
  done
  maxcol=$RANDOM
  let "maxcol %= $RANGE"
  
  while [ "$maxcol" -lt "$ettnoll" ]
    do
    maxcol=$RANDOM
    let "maxcol %= $RANGE"
  done
  echo "maxcol $maxcol"
  echo "maxrow $maxrow"
done
echo "-----------------"
