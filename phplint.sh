#!/bin/bash

myvalue=$(phplint "php-redis/*.php")
echo $myvalue

if [[ $myvalue == *"No syntax errors"* ]];then
        exit 0;
    else
        exit 1;
fi