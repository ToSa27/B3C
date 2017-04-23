#!/bin/bash
export MYIP=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
docker run --name vis -p 90:8080 -v /var/run/docker.sock:/var/run/docker.sock -d dockersamples/visualizer
docker run --name hub -p 5000:5000 -d registry
docker build -t myhello:1 ~/B3C/docker1/
docker tag myhello:1 $MYIP:5000/myhello:1
docker push $MYIP:5000/myhello:1
docker build -t myhello:2 ~/B3C/docker2/
docker tag myhello:2 $MYIP:5000/myhello:2
docker push $MYIP:5000/myhello:2
