for dir in ${@:2}
do
cd ./$dir
ls -p| grep $1| ls -s |grep -e [1...9]
cd ~
done

