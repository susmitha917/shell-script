#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "Please run this script with root access."
else
   echo "You are super user"
   exit 1 # manually exit if error comes
fi

dnf install mysql -y

echo "is script proceeding?"