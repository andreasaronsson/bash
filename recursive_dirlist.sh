#!/bin/bash

move()
{

    echo "I AM NOW IN: ${PWD}"
    echo "CHANGING TO $1"
    cd $1
    NUM=$(ls -d */|wc -l)
    echo "NUM IS NOW $NUM"
    echo "WHEN IN ${PWD}"

    until [ $NUM -lt 1 ]
      do

      for DIR in $(ls -d */)
	do
	move $DIR
      done

    done

    ls
    cd ..

}

GOTODIR=/home/aron/tmp

move $GOTODIR 