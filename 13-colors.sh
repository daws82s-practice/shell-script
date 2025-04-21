#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


validate(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 .... $R FAILED $N"
        exit 1
    else
        echo -e "$2 .... $G SUCCESS $N"
    fi
}

if [ $USERID -ne 0 ]
then
    echo -e " $R ERROR :: Please run this script with ROOT access $N"
    exit 1
fi

dnf installed list mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    validate $? "Installing MYSQL"
else
    echo "$G MYSQL already installed $N"
fi

dnf installed list nginx
if [ $? -ne 0 ]
then
    dnf install nginx -y
    validate $? "Installing Nginx"
else
    echo "$G NGINX already installed $N"
fi

