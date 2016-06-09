#!/bin/bash

if [ $1 = -l ]
then
    find ${@:3} -type f -exec wc -c {} \; | cut -f1 -d' ' | sort -n | head -$2
else
    find ${@:2} -type f -exec wc -c {} \; | sort -n | head -$1
fi
