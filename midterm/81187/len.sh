#!/bin/bash

# Your script does not support multiple directories as arguments!  (-0.1)

for i in $(find $2 -type f | grep $1$)
do
	echo $(wc -c < $i)
done

# Total points for this task:  0.9/1
