#!/bin/sh
#
# This shell script solves the first problem.
#
# the `-p` option forces the creation of each directory in the path without
# complaining that the directory exists
# in this case it creates `tmp` and `$USER`
mkdir -p /tmp/$USER
# `-L` makes this line work on the machines where `/bin` is a symlink
find -L /bin -name 'mk*' -type f -exec cp {} /tmp/$USER \;
