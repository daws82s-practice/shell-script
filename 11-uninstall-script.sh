#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "ERROR :: Please run this script as root user"
    exit 1
fi

dnf list installed mysql

if [ $? -eq 0 ]
then
    dnf remove mysql -y
    if [ $? -ne 0 ]
    then
        echo "Uninstalling MySQL ... FAILURE"
        exit 1
    else
        echo "Uninstalling MYSQL ... SUCCESS"
    fi
else    
    echo "MySQL already uninstalled"
fi


dnf list installed git 

if [ $? -eq 0 ]
then
    dnf remove git -y
    if [ $? -ne 0 ]
    then
        echo "Uninstalling git .... FAILURE"
        exit 1
    else
        echo "Uninstalling Git ... SUCCESS"
    fi
else
    echo "Already git uninstalled"

fi


