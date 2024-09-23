#!/bin/bash

is_prime() {
    n=$1
    # Kiem tra n <= 1
    if [ $n -le 1 ]; then
        echo "$n khong phai la so nguyen to!"
        exit
    fi
    # Kiem tra
    for ((i = 2; i*i <= n; i++)) do
            # Kiem tra n co chia het cho i hay khong
            if [ $((n%i)) -eq 0 ]; then
                echo "$n khong la so nguyen to"
                exit
            fi
    done
}
# Nhap vao so tu nguoi dung
read -p "Nhap so can kiem tra: " number

# Goi mot ham de kiem tra
is_prime $number