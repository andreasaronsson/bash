#! /bin/sh
# Script removing given argument from filenames in dir. 

filelist=$(ls -d *$1*)

for i in $filelist
do 
  NEWNAME=$(echo $i | sed s/$1//)
  echo 'HERE IS NEWNAME '$NEWNAME
  mv $i $NEWNAME
done
