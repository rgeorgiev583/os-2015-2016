#!/bin/sh
#
# This shell script solves the third problem.
#
# The `-p` option forces the creation of each directory in the path given as
# argument without complaining that the directory exists.
# In this case it creates `/tmp` and `/tmp/$USER`.
#
mkdir -p /tmp/$USER
#
# We execute `bash` instead of `grep` because we have to redirect `grep`'s
# output (`>`) to a different file every time, and I/O redirection is handled
# by the shell as we only want the base name of the file (i.e. without the
# path), we use the `basename` command.  As we use single quotes (`''`),
# nothing in the exec command will be substituted by the shell in which `find`
# was executed (i.e. the argument is passed literally).  However, `$USER` and
# `$(basename {})` substitution patterns will be replaced by the second shell
# (which is executed by `find` AFTER replacing the `{}`s'), which is exactly
# what we want.
#
# `-L` makes this line work on machines where `/etc` is a symlink
find -L /etc -name '*.conf' -type f -exec bash -c 'grep = {} > /tmp/$USER/$(basename {})' \;
