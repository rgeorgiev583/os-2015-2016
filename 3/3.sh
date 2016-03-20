#!/bin/sh
#
# We use `:` as an argument to `-d` because in `/etc/group` it separates the
# different fields for each group.
# We use `1` as an argument to `-f` because the group name is the first field
# delimited by `:`.
#
grep daemon /etc/group | cut -d: -f1
