#!/bin/bash

USERID = $(id -u)

if[ $USERID -ne 0 ]
then
    echo "ERROR :: Please run this script with ROOT access"
    exit 1
fi

dnf installed list mysql
if[ $? -ne 0 ]
then
    dnf install mysql -y
    if[ $? -ne 0 ]
    then
        echo "Installing MYSQL .... FAILED"
        exit 1
    else
        echo "Installing MYSQL .... SUCCESS"
    fi
else
    echo "MYSQL already installed"
fi

dnf installed list nginx
if[ $? -ne 0 ]
then
    dnf install nginx -y
    if[ $? -ne 0 ]
    then
        echo "Installing NGINX .... FAILED"
        exit 1
    else
        echo "Installing NGINX .... SUCCESS"
    fi
else
    echo "NGINX already installed"
fi

