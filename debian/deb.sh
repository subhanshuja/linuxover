# enter root if not root user
su

# preliminary
apt update && dist-upgrade -fy

# base, docker, database, server
apt install apt-transport-https ca-certificates curl wget gnupg-agent software-properties-common gcc g++ git openssh-server xclip 

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

apt install docker-ce docker-ce-cli containerd.io nginx mariadb-server redis

# download linux-firmaware
mkdir linux-firmaware && cd linux-firmaware
git clone https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git

# if not know firmware, copy all linux-firmawre to /lib/linux-firmware
cd linux-firmware && cp -R * /lib/firmware/

# nvidia
apt install nvidia-smi nvidia-driver nvidia-cuda-toolkit mesa-utils

#if problem with nouveau and nvidia
Xorg -continue
cp -R /root/xorg.conf.new /etc/X11/xorg.conf

# monitor performance
apt install htop lshw

# designer, office, pdf
apt install gimp inkscape openscad libreoffice scribus

# complete installation for coding java, javascript, python, php
apt install default-jre default-jdk npm yarn
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-linux-x86_64.sh

# IDE Android
wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/4.1.2.0/android-studio-ide-201.7042882-linux.tar.gz
tar -xvzf android-studio-ide-201.7042882-linux.tar.gz
./android-studio/bin/studio.sh &

# Code Visual Studio
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
apt install code