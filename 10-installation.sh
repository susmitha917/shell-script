#!/bin/bash

USERID=$(id -u)

if[ $USERID -ne 0 ]
then
   echo "Please run this script with root access."
else
   echo"You are super user"
if
dnf install mysql -y