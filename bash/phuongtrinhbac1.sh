#!/bin/bash

# form: ax + b = 0
read -p "Nhap he so a: " a
read -p "Nhap he so b: " b

# Giai phuong trinh
if [ $a -eq 0 ]; then
        if [ $b -eq 0 ]; then
                echo "Phuong trinh co vo so nghiem"
        else
                echo "Phuong trinh vo nghiem"
        fi
else
        x=$(echo "scale=2; -$b/$a" | bc )
        echo "Nghiem cua phuong trinh la x = $x";
fi