#!/bin/sh
#
# This shell script solves the first problem using `find`.
#
# The `-p` option forces the creation of each directory in the path given as
# argument without complaining that the directory exists.
# In this case it creates `/tmp` and `/tmp/$USER`.
#
mkdir -p /tmp/$USER
#
# We put `mk*` in single quotes because the `*` must not be expanded by the
# shell for `find` to work correctly.
#
# `-L` makes this line work on machines where `/bin` is a symlink
find -L /bin -name 'mk*' -type f -exec cp {} /tmp/$USER \;
