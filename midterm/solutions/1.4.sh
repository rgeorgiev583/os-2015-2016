#!/bin/bash

stripext()
{
    while read -r path
    do
        path=${path##*/}
        path=${path%%.*}
        echo $path
    done
}

for filename in "$@"
do
    stripext < $filename
done

if [ $# -eq 0 ]
then
    stripext
fi
