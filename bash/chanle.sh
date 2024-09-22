#!/bin/bash

# Nhap du lieu
read -p "Nhap vao so nguyen: " number

# Checking
if [ $((number%2)) -eq 0 ];  then
        echo "$number la so chan"
else
        echo "$number la so le"
fi