
for user in `cut -d ',' -f1 $1`
do
usermod -s /sbin/nologin $user


done
