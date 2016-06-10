#!/bin/bash

if [ $1 = -n ]
then
    for user in ${@:3}
    do
        echo $(ps aux | grep ^$user | grep $2 | awk '{ print $2 }')
    done
else
    for user in $@
    do
        echo $(ps aux | grep ^$user | awk '{ print $2 }')
    done
fi
