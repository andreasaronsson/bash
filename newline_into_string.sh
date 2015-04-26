#!/bin/bash

str="originalstring"
name="nextstring"
CR=$'\015'
FF=$'\014'
LF=$'\000012'
NL=$'\\\\n'
str="${str}${LF}${name}"

echo $str
