#!/bin/sh
#
# We use `:` as an argument to `-d` because in `/proc/meminfo` it separates each
# parameter name from its respective value.
# We use `2` as an argument to `-f` because the value is the second field
# delimited by `:`.
#
grep 'MemFree' /proc/meminfo | cut -d: -f2
