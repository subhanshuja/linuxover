# enter root if not root user
su

# preliminary
apt update && dist-upgrade -fy
apt remove --purge x11-common
apt autoremove

# base, docker, database, server
apt install apt-transport-https ca-certificates curl wget gnupg-agent software-properties-common gcc g++ git openssh-server xclip

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

apt install docker-ce docker-ce-cli containerd.io nginx mariadb-server redis

# complete installation for coding java, javascript, python, php
apt install default-jre default-jdk npm yarn
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-linux-x86_64.sh