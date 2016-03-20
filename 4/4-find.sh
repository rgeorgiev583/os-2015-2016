#!/bin/sh
#
# This shell script solves the fourth problem using `find`.
#
# The `-p` option forces the creation of each directory in the path given as
# argument without complaining that the directory exists.
# In this case it creates `/tmp`, `/tmp/$USER` and `/tmp/$USER/etc`.
#
mkdir -p /tmp/$USER/etc
#
# Here we use the `-o` operator, which is a logical OR.  Because it has higher
# precedence than the implied AND, it has to be wrapped in parentheses.
# (The parentheses have to be escaped because they have special meaning for
# `bash`, and we want `find` to interpret them.)
#
# `-L` makes this line work on the machines where `/etc` is a symlink
find -L /tmp/$USER \( -name '*.conf' -o -name '*.settings' \) -type f -exec mv {} /tmp/$USER/etc \;
