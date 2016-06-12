#!/bin/bash

# A simple and elegant solution! Well done!  (+0.1)

for user
do
    #   It does not make sense to pipe `awk`'s output to `kill`.
    # It should be provided as arguments to `kill` instead using `xargs`.
    # (-0.1)
    # Like this:
	#ps aux | grep ^$user | awk '{print $2}' | xargs kill
    # Or:
    #kill $(ps aux | grep ^$user | awk '{print $2}')
	ps aux | grep $user | awk '{print $2}' | kill
done

# Total points for this task:  1/1
