#!/bin/bash

# nhap du lieu
read -p "Nhap vao so thu nhat: " a 
read -p "Nhap vao so thu hai: " b

# Tinh toan
tong=$(($a + $b))
hieu=$(($a - $b))
echo "$a + $b = $tong"
echo "$a - $b = $hieu"