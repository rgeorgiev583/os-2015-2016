#!/bin/sh
#
# This shell script solves the subproblem of the third problem.
#
# The `-p` option forces the creation of each directory in the path given as
# argument without complaining that the directory exists.
# In this case it creates `/tmp` and `/tmp/$USER`.
#
mkdir -p /tmp/$USER
#
# Everything here is like the `find` command invocation in `3.sh` but we use
# the `-s SUFFIX` option of `basename` which removes `SUFFIX` from the end of
# the filename.  In this case it removes `.conf` from the end of each filename.
#
# `-L` makes this line work on machines where `/etc` is a symlink
find -L /etc -name '*.conf' -type f -exec bash -c "grep '=' {} > /tmp/$USER/\$(basename -s .conf {}).settings" \;
