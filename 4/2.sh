#!/bin/sh
#
# This shell script solves the second problem.
#
# The `-p` option forces the creation of each directory in the path given as
# argument without complaining that the directory exists.
# In this case it creates `/tmp` and `/tmp/$USER`.
#
mkdir -p /tmp/$USER
#
# The `^\[` regular expression matches a `[` in the beginning of the line
# (`^` matches what follows it if it is in the beginning of the line).
# `[` has to be escaped because it has special meaning in regexes.
# The redirection is after the whole `find` command line because it has to be
# done on the whole `find` output (i.e. after `find` has finished searching for
# files).
#
# `-L` makes this line work on machines where `/etc` is a symlink
find -L /etc -name '*.conf' -type f -exec grep '^\[' {} \; > /tmp/$USER/headers
