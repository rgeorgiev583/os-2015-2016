#!/bin/sh
#
# This shell script solves the first problem using glob patterns.
#
# The `-p` option forces the creation of each directory in the path given as
# argument without complaining that the directory exists.
# In this case it creates `/tmp` and `/tmp/$USER`.
#
mkdir -p /tmp/$USER
#
# The shell glob pattern `/bin/mk*` matches all files in the `/bin` directory
# whose names begin with `mk`.
# For example, if `/bin` contains `mkdir`, `mkfifo`, `mkfs`, `mknod` and
# `mkswap`, `/bin/mk*` will match the following:
# `/bin/mkdir /bin/mkfifo /bin/mkfs /bin/mknod /bin/mkswap`
#
# NOTE: This will only work for files in `/bin` (i.e. it will not be applied
# recursively to subdirectories).  If we want to include subdirectories, we have
# to use `find`.
#
cp /bin/mk* /tmp/$USER
