echo "Starting backup Linux mail server and user account"

mkdir /root/BackupMailANDUser

export UGIDLIMIT=500  ##backup uid > 500 user password and account

awk -v LIMIT=$UGIDLIMIT -F: '($3>=LIMIT) && ($3!=65534)' /etc/passwd > /root/BackupMailANDUser/passwd.mig


awk -v LIMIT=$UGIDLIMIT -F: '($3>=LIMIT) && ($3!=65534)' /etc/group > /root/BackupMailANDUser/group.mig   ## 複製群組帳號

awk -v LIMIT=$UGIDLIMIT -F: '($3>=LIMIT) && ($3!=65534) {print $1}' /etc/passwd | tee - |egrep -f - /etc/shadow > /root/BackupMailANDUser/shadow.mig ## 複製/etc/shadow

cp /etc/gshadow /root/BackupMailANDUser/gshadow.mig  ##複製/etc/gshadow

tar -zcvpf /root/BackupMailANDUser/home.tar.gz /home    ## 備份/home 使用者的個人收信夾

tar -zcvpf /root/BackupMailANDUser/spoolmail.tar.gz /var/spool/mail ## 備份/var/spool/mail 使用者尚未發出去

tar -zcvpf /root/BackupMailANDUser/varmail.tar.gz /var/mail ## 備份/var/mail 使用者尚未讀取





####################################################################################
#
#tar -zxvf 解壓縮
#
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
