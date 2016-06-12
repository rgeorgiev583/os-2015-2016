#!/bin/bash

if [ $# -lt 2 ]
then
    echo error: not enough arguments 1>&2
    exit 1
fi

firstdir=$(realpath $1)
seconddir=$(realpath $2)
find $firstdir -exec ./compress {} $firstdir $seconddir \;
