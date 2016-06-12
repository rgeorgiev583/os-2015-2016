if [ $# -eq 0 ]; then
while read line
do
cut -f1 -d "." "$line"
done
fi
