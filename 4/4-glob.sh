#!/bin/sh
#
# This shell script solves the fourth problem using glob patterns.
#
# The `-p` option forces the creation of each directory in the path given as
# argument without complaining that the directory exists.
# In this case it creates `/tmp`, `/tmp/$USER` and `/tmp/$USER/etc`.
#
mkdir -p /tmp/$USER/etc
# this is substantially simpler than the `find` solution
# (however, it is not recursive)
mv /tmp/$USER/*.conf /tmp/$USER/*.settings /tmp/$USER/etc
