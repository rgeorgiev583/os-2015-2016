#!/bin/bash

if [ $1 = -s ]
then
    sizes=$(find ${@:3} -name "*.$2" -type f -exec wc -c {} \; | cut -f1 -d' ')
    total=0

    for size in $sizes
    do
        total=$(($total + $size))
    done

    echo $total
else
    find ${@:2} -name "*.$1" -type f -exec wc -c {} \; | cut -f1 -d' '
fi
