for file in $1/*
do
	if ! [ -f $file ]
	then
		mkdir $file
	else
		if f=$( find "$2" -name "$file.gz" ) && (( stat-c %Y $f > stat-c %Y $file))
		then
			cat $1/$file | gzip -c > $f
		fi
	fi
done
		
