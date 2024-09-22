#!/bin/bash

# nhap so
read -p "Nhap so thap phan: " a

# Chuyen sang nhi phan
gt=""

while [ $a -gt 0 ]; do
        sodu=$(($a%2))  
        gt="$sodu$gt"
        a='expr $a / 2'
        echo $a
done
echo "$a co gia tri o he thap phan la: $gt"
