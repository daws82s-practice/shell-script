#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

validate(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 .... $R FAILED $N"
        exit 1
    else
        echo -e "$2 .... $G SUCCESS $N"
    fi
}

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME


if [ $USERID -ne 0 ] &>>$LOG_FILE_NAME
then
    echo -e " $R ERROR :: Please run this script with ROOT access $N"
    exit 1
fi

dnf installed list mysql &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install mysql -y &>>$LOG_FILE_NAME
    validate $? "Installing MYSQL"
else
    echo -e "$G MYSQL already installed $N"
fi

dnf installed list nginx &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install nginx -y &>>$LOG_FILE_NAME
    validate $? "Installing Nginx $N"
else
    echo -e "$G NGINX already installed $N"
fi

