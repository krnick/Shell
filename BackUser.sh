echo "Starting backup Linux user account"


export UGIDLIMIT=500  ##backup uid > 500 user password and account

export backup_directory="/root/BackupUser"`date +"%F_%T"`

mkdir $backup_directory


awk -v LIMIT=$UGIDLIMIT -F: '($3>=LIMIT) && ($3!=65534)' /etc/passwd >  $backup_directory/passwd.mig


awk -v LIMIT=$UGIDLIMIT -F: '($3>=LIMIT) && ($3!=65534)' /etc/group > $backup_directory/group.mig   ## 複製群組帳號

awk -v LIMIT=$UGIDLIMIT -F: '($3>=LIMIT) && ($3!=65534) {print $1}' /etc/passwd | tee - |egrep -f - /etc/shadow >  $backup_directory/shadow.mig ## 複製/etc/shadow

cp /etc/gshadow   $backup_directory/gshadow.mig  ##複製/etc/gshadow

tar -zcvpf $backup_directory/home.tar.gz /home    ## 備份/home 使用者的directory







####################################################################################
#
#tar -zxvf 解壓縮
#tar -zxvf home.tar.gz /home
#
#
#將舊帳號加入新機帳號檔
# cat passwd.mig >> /etc/passwd
# cat group.mig >> /etc/group
# cat shadow.mig >> /etc/shadow
# cp gshadow.mig /etc/gshadow
#
#
####################################################################################
