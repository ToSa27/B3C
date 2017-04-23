#!/bin/bash
export MYIP=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
docker swarm init
docker service create --name hello -p 80:3000 $MYIP:5000/myhello:1
read -p "Let the other machines join the swarm, then press enter to continue..."
docker service scale hello=2
read -p "Press enter to continue.."
docker service scale hello=5
read -p "Press enter to continue.."
docker service update --update-delay 5s --image $MYIP:5000/myhello:2 hello

