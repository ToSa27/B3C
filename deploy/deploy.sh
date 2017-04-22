#! /bin/bash

# proxy setup
if ping -c 1 137.185.234.1 &> /dev/null
then
  echo "proxy=http://104.129.198.34:9400" > /etc/profile.d/proxy.sh
  echo "export http_proxy=\$proxy" >> /etc/profile.d/proxy.sh
  echo "export https_proxy=\$proxy" >> /etc/profile.d/proxy.sh
  echo "export ftp_proxy=\$proxy" >> /etc/profile.d/proxy.sh
  echo "export no_proxy=localhost,127.0.0.1,.pg.com" >> /etc/profile.d/proxy.sh
  echo "export HTTP_PROXY=\$http_proxy" >> /etc/profile.d/proxy.sh
  echo "export HTTPS_PROXY=\$https_proxy" >> /etc/profile.d/proxy.sh
  echo "export FTP_PROXY=\$ftp_proxy" >> /etc/profile.d/proxy.sh
  echo "export NO_PROXY=\$no_proxy" >> /etc/profile.d/proxy.sh
  chmod 755 /etc/profile.d/proxy.sh
  . /etc/profile.d/proxy.sh
  echo "proxy=$proxy" >> /etc/yum.conf 
fi

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
