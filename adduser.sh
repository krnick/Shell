

for user in `cut -d ',' -f1 $1`
do
useradd -m -s /bin/bash $user

echo $user:$user | chpasswd


done
