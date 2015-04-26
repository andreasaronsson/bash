#! /bin/sh

echo $1


#for FILES in `find . -maxdepth 1 -name '$1*' -print`
#FILES=`find . -type f -name '$1*'`

filelist=$(ls *$1*)

for i in $filelist
do 
  echo 'HERE ORIGINAL'
  echo $i
  NEWNAME=$(echo $i | sed s/$1//)
  echo 'NEWNAME!!'
  echo $NEWNAME
#  mv $i $NEWNAME
done