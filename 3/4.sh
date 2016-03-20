#!/bin/sh
#
# In the output of `ps ax` columns (fields) are delimited by multiple spaces,
# so we can't use `cut` because it can only accept one character as a delimiter.
# Therefore we will use `awk`'s `print $n` command, which prints the nth column
# separated by whitespace on each line.
#
ps ax | grep bash | awk '{ print $2 }'
