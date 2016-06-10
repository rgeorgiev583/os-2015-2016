#!/bin/bash

if [ $1 = -s ]
then
    total=0

    for size in $(find ${@:3} -name "*.$2" -type f -exec wc -c {} \; | cut -f1 -d' ')
    do
        total=$(($total + $size))
    done

    echo $total
else
    find ${@:2} -name "*.$1" -type f -exec wc -c {} \; | cut -f1 -d' '
fi
