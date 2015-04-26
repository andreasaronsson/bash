#!/bin/bash

move ()
{

    cd $1
    NUM=$(ls -d */|wc -l)

    until [ $NUM -lt 1 ]
      do

      for DIR in $(ls -d */)
        do
        move $DIR
      done

    done

    rename
    cd ..

}

rename()
{
    
    for fname in *    #Traverse all files in directory
      do
      n=$(echo $fname | tr A-Z a-z)
      if [ "$fname" !=  "$n"  ]
          then
          mv "$fname" "$n"
      fi
      FOUND=0
      if [ `echo "$n" | grep -c ' '` -gt $FOUND ]   #check for spaces
          then
          fin=$(echo $n | sed -e 's/ /_/g')  # Substitute underscore for blank
          mv "$n" "$fin"            # Do the actual renaming
      fi   
    done
    
}


WORKDIR=${PWD}

move $WORKDIR

exit 1
