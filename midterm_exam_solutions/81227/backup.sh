if [ $# -ne 2 ]; then
exit(99)
fi

cd $1;
for file in $(ls)
do
zipped_file=echo $file.gz
first_date=$(stat -c %Y $file > date +%s -d)
cd ~/$2;
if [ ls |grep $zipped_file ]; then
second_date=$(stat -c %Y $zipped_file > date +%s -d)
   if [ first_date -gt second_date ]; then
       gzip -c $file
   fi
else
	gzip -c $file
fi
done