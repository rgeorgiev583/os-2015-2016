#!/bin/sh
#
# We use `:` as an argument to `-d` because in `/proc/cpuinfo` it separates each
# parameter name from its respective value.
# We use `2` as an argument to `-f` because the value is the second field
# delimited by `:`.
#
# This version trims the whitespace from the beginning of each line.
#
grep 'model name' /proc/cpuinfo | cut -d: -f2 | sed 's/^ \+//g'
