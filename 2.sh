#!/bin/bash

compress()
{
    first=$1
    firstdir=$2
    seconddir=$3
    second=$(eval echo $seconddir/\${first\#$firstdir})
    echo $first $firstdir $seconddir $second

    if [ -d $first ] && ! [ -e $second ]
    then
        mkdir $second
    elif ! [ -e $second ] || [ $(stat -c %Y $first) -gt $(stat -c %Y ${second}.gz) ]
    then
        gzip -c $first > ${second}.gz
    fi
}

export -f compress
firstdir=$(realpath $1)
seconddir=$(realpath $2)
find $firstdir -exec bash -c "compress {} $firstdir $seconddir" \;
