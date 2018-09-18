for i in `cat $1`
do

	echo  "$i 帳號刪除"
	userdel -rf $i  
	echo "$i delete ok!"
done
