#!/bin/bash
echo "Please enter the username:"
read -s USERNAME
echo "Entered username is: $USERNAME"

echo "Please enter the password:"
read -s PASSWORD
echo "Entered password is: $PASSWORD"
echo "Please enter the password again:"
read -s PASSWORD2
if [ "$PASSWORD" == "$PASSWORD2" ]; then
    echo "Password match!"
else
    echo "Password mismatch!"
fi
echo "Please enter the password again:"
read -s PASSWORD3
if [ "$PASSWORD" == "$PASSWORD3" ]; then
    echo "Password match!"
else
    echo "Password mismatch!"
fi
echo "Please try after some time!"

