#!/bin/bash

myvalue=$(kubectl describe service frontend | egrep -o -i 'green')

if [[ $myvalue == *"green"* ]];then
        exit 0;
    else
        exit 1;
fi