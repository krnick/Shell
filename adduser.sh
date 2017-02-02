for i in `cat $1`
do

	echo  "$i 帳號建立 "
	useradd -m $i -p "$i"
	echo "$i:$i"|chpasswd
	echo "$i 建立完成:"
done
