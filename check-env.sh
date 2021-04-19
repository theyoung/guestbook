#!/bin/bash

myvalue=$(kubectl describe service frontend | egrep -o -i 'blue')

if [[ $myvalue == *"blue"* ]];then
        COLOR=green
    else
        COLOR=blue
fi

echo "$COLOR deleting deployments"
kubectl delete deployments "frontend-$COLOR" #make sure delete

echo "$COLOR deploy and start"
envsubst < frontend-deployment.yaml | kubectl apply -f -
envsubst < frontend-service.yaml | kubectl patch service frontend --patch-file -