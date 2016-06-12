#!/bin/sh
tail -qn1 $@ | awk '{ print $7 }' | cut -f1 -d/
