#!/bin/bash

USERID=$(id -u)
validate(){
    if [ $1 -ne 0 ]
    then
        echo "$2 .... FAILED"
        exit 1
    else
        echo "$2 .... SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR :: Please run this script with ROOT access"
    exit 1
fi

dnf installed list mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    validate $? "Installing MYSQL"
else
    echo "MYSQL already installed"
fi

dnf installed list nginx
if [ $? -ne 0 ]
then
    dnf install nginx -y
    validate $? "Installing Nginx"
else
    echo "NGINX already installed"
fi

