#!/bin/sh
#
# We use `:` as an argument to `-d` because in `/proc/meminfo` it separates each
# parameter name from its respective value.
# We use `2` as an argument to `-f` because the value is the second field
# delimited by `:`.
#
# This version trims the whitespace from the beginning of each line.
#
grep 'MemFree' /proc/meminfo | cut -d: -f2 | sed 's/^ \+//g'
