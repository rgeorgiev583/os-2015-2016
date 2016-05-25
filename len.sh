for i in $(find $2 -type f | grep $1$)
do
	echo $(wc -c < $i)
done
