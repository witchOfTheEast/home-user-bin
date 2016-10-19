#!/bin/bash
myFile=$1

declare statements

while IFS='' read -r line || [[ -n "$line" ]]; do
    statements+=("$line"); 
done < $myFile

numLines=${#statements[@]}

ranNum=$((RANDOM % numLines))

curStatement=${statements[ranNum]}

/usr/bin/twmnc $curStatement
