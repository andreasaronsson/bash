#!/bin/bash

if [ ! -n "$1" ]
then
  echo "Usage: `basename $0` filename"
  exit 0
fi

TIME=""
IP=""
PORT=""
MOV=""

cat $1 |
while read LINE
  do
  
  if [ ${#LINE} -eq 8 ]
      then

      TIME=$LINE

  else
      ARR=( $LINE )
     IP=${ARR[0]}
     PORT=${ARR[1]}
     MOV=${ARR[2]}

  fi
  
#   echo TIME:  $TIME 
#   echo IP:    $IP 
#   echo PORT:  $PORT 
#   echo MOV:   $MOV
#  echo NEWLINE!!!!
  /usr/bin/mysql test -h lestat -u aron -e "INSERT INTO movable_gnu (time, ip, port, mov) VALUES ('$TIME','$IP',$PORT,$MOV)"
  echo "INSERT INTO movable_gnu (time,ip,port,mov) VALUES ('$TIME','$IP', $PORT, $MOV)"

done