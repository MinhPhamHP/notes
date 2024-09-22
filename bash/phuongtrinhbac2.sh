#!/bin/bash

# ax^2 + bx + c = 0
read -p "Nhap vao cac he so a b c: " a b c

# Tinh delta
delta=$(($b*$b-4*$a*$c))

# Kiem tra
if [ $delta -lt 0 ]; then
        echo "Phuong trinh vo nghiem !"""
elif [ $delta -eq 0 ]; then
        x=$(echo "scale=2; -($b)/(2*$a)" | bc)
        echo "Phuong trinh co nghiem kep: x=$x"
else
        x1=$(echo "scale=2; (-$b+sqrt($delta))/(2*$a)" | bc)
        x2=$(echo "scale=2; (-$b-sqrt($delta))/(2*$a)" | bc)
        echo "Phuong trinh co 2 nghiem phan biet: "
        echo "x1=$x1"
        echo "x2=$x2"
fi