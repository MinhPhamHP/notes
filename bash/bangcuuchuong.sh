#!/bin/bash

read -p "Nhap vao so nguyen [1-9]: " a

# Vong lap
for i in {1..9}; do
        gt=$(($a*$i))
        echo "$a x $i = $gt"
done
