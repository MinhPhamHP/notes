#!/bin/bash

# Read data from keyboard, save data to variable
read -p "Nhap ten cua ban: " name
read -p "Nhap tuoi cua ban: " age
read -sp "Nhap mat khau cua ban: " password && echo "\n"
echo  "Nhap vao list so yeu thich cua ban: "
read -a array

# Print data to screen
echo "Ten: $name"
echo "Tuoi: $age"
echo "Matkhau: $password"
echo "Day so yeu thich: $array"