#!/bin/bash

# Nhap mang
read -p "Nhap cac so cach nhau boi dau cach: " -a arr

# So luong phan tu trong mang
n=${#arr[@]}

# Khoi tao mot bien tong
tong=0

# Tinh tong cac so trong mang
for ((i=0; i<n; i++)); do 
        tong=$((tong + ${arr[$i]}))
done

# Hien thi ket qua
echo "Tong cua cac so trong mang: $tong"
