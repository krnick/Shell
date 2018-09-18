<<<<<<< HEAD


for user in `cut -d ',' -f1 $1`
do
useradd -m -s /bin/bash $user

echo $user:$user | chpasswd


=======
for i in `cat $1`
do

	echo  "$i 帳號建立 "
	useradd -m $i -p "$i"
	echo "$i:$i"|chpasswd
	echo "$i 建立完成:"
>>>>>>> 5257b7aca9b4f85ce9dd7a6303394e0ae175a714
done
