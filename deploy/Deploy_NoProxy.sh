#! /bin/bash

# proxy setup
#echo "proxy=http://104.129.198.34:9400" > /etc/profile.d/proxy.sh
#echo "export http_proxy=\$proxy" >> /etc/profile.d/proxy.sh
#echo "export https_proxy=\$proxy" >> /etc/profile.d/proxy.sh
#echo "export ftp_proxy=\$proxy" >> /etc/profile.d/proxy.sh
#echo "export no_proxy=localhost,127.0.0.1,.pg.com" >> /etc/profile.d/proxy.sh
#echo "export HTTP_PROXY=\$http_proxy" >> /etc/profile.d/proxy.sh
#echo "export HTTPS_PROXY=\$https_proxy" >> /etc/profile.d/proxy.sh
#echo "export FTP_PROXY=\$ftp_proxy" >> /etc/profile.d/proxy.sh
#echo "export NO_PROXY=\$no_proxy" >> /etc/profile.d/proxy.sh
#chmod 755 /etc/profile.d/proxy.sh
#. /etc/profile.d/proxy.sh
#echo "proxy=$proxy" >> /etc/yum.conf 

# install other funny stuff
yum install -y nano git psmisc

# install docker
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum makecache fast
yum install -y docker-ce
systemctl enable docker
systemctl start docker
usermod -G docker centos
sed -i '/^ExecStart=/ s/$/ --insecure-registry docker.die-hoffs.net:5000/' /usr/lib/systemd/system/docker.service
systemctl daemon-reload
service docker restart

# install nodejs
#curl -sL https://rpm.nodesource.com/setup_7.x | bash -
#yum install -y nodejs

# pull content via git
git clone https://github.com/ToSa27/B3C.git /home/centos/files

