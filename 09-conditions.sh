#!/bin/bash

NUMBER=$1

if [ $NUMBER -GT 10]
then
  echo "Given number $NUMBER is greater than 10"
else
  echo "Given number $NUMBER is less than 10"
fi