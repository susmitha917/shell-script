#!/bin/bash

echo "All variables: $@"
echo "Number of variables passed: $#"
echo "Script Name: $0"
echo "Current working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "Which user is rnning this script: $USER"
echo "Hostname: $HOSTNAME"
echo "Process ID of current shell script: $$"
sleep 60
echo "Process ID of last back ground command: $!"