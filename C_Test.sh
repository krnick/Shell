for dir in `ls |grep -v nick|grep -v C_Test.sh`
do
	echo Building $dir

        #adding Test dir
        mkdir -p $dir/Final
	mkdir -p $dir/Final/EX1
        mkdir -p $dir/Final/EX2
        mkdir -p $dir/Final/EX3
        mkdir -p $dir/Final/EX4
        mkdir -p $dir/Final/EX5

	#change for their own directory
	chown $dir:$dir $dir -R
	#delete other permission rwx
	chmod -R o-rwx $dir
done
