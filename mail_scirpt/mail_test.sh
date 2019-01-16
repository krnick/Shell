#for computer network mail test

#read file for class csv 
for user in `cut -d ',' -f1 $1`
do

#encode
content_mail="$user Happy New Year";

encode=$(printf "\0%s" "$content_mail" | base64)

##mail to class
echo $encode > temp_file.txt
mail -s "Computer Network Final Exam" $user < temp_file.txt


#echo "Encode:"$encode


#decode

#decode=$(echo $encode | base64 -d)

#echo "Decode:"$decode


done
