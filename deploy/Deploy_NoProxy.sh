#! /bin/bash

# install basic stuff
yum install -y nano git psmisc

# install docker
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum makecache fast
yum install -y docker-ce
sed -i '/^ExecStart=/ s/$/ --insecure-registry docker.die-hoffs.net:5000/' /usr/lib/systemd/system/docker.service
systemctl enable docker
systemctl start docker
usermod -G docker centos

# pull content via git
git clone https://github.com/ToSa27/B3C.git /home/centos/B3C
