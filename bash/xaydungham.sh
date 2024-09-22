#!/bin/bash

xin_chao(){
    echo "Xin chao ban!"
}

xin_chao_ten(){
    echo "Xin chao $1"
}

if [ "$1" == "name" ]; then 
        xin_chao_ten "$2"
else
        xin_chao
fi