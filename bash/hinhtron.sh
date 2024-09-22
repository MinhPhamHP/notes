#!/bin/bash

# Please input radius of circle
read -p "Nhap vao ban kinh hinh tron: " radius

# Calculate area, circumference
PI=3,14

area=$(($PI*$radius*$radius))
circum=$((2*$PI*$radius))

# Print result to display
echo "Dien tich hinh tron la: $area"
echo "Chu vi hinh tron la: $circum"