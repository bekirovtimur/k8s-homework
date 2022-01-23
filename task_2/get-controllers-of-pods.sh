#!/bin/sh
kubectl -n kube-system get pods | grep \/ | awk {print'$1'} | \
while read line ; do
        echo $line
        kubectl describe pods/$line -n kube-system | grep "Controlled By"
        echo "---"
done
