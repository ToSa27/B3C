#!/bin/bash
echo "make sure docker.die-hoffs.net points to this manager node's public IP"
docker run --name hub --restart always -p 5000:5000 -d registry
docker build -t myhello:1 ~/B3C/docker1/
docker tag myhello:1 docker.die-hoffs.net:5000/myhello:1
docker push docker.die-hoffs.net:5000/myhello:1
docker build -t myhello:2 ~/B3C/docker2/
docker tag myhello:2 docker.die-hoffs.net:5000/myhello:2
docker push docker.die-hoffs.net:5000/myhello:2
