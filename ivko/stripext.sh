if [ -z $#]
then
	while read line
	do
		shorname=$(basename "$line")
		shortname="${$shortname%.*}"
		echo $shortname
else
for file
do
	for line in $file
	do
		shortname=$(basename "$line")
		shortname="${$shortname%.*}"
		echo $shortname
	done
done	
fi	
