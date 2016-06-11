for user in $*
do
$(ps aux| grep $user; cut -f2 -d " ")
done
exit 0
