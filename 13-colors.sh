#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


validate(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 .... $R FAILED"
        exit 1
    else
        echo -e "$2 .... $G SUCCESS"
    fi
}

CHECK_ROOT() {
    if [ $USERID -ne 0 ]
    then
        echo -e " $R ERROR :: Please run this script with ROOT access"
        exit 1
    fi

}

CHECK_ROOT


dnf installed list mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    validate $? "Installing MYSQL"
else
    echo -e "$G MYSQL already installed"
fi

dnf installed list nginx
if [ $? -ne 0 ]
then
    dnf install nginx -y
    validate $? "Installing Nginx"
else
    echo -e "$G NGINX already installed"
fi

