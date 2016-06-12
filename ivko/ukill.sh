for user
do
	ps aux | grep $user | awk '{print $2}' | kill
done 
