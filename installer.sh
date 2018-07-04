#!/bin/bash

source copy_bashrc.sh

sudo apt-get update

#linux packages:
sudo apt-get install git vim ipython ipython3 wireshark radare2 gdb gcc make net-tools chromium-browser gparted	apache2 bless curl virtualbox zsh

#Java:
sudo apt-get install default-jre
sudo apt-get install default-jdk

#sublime-text-3:
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer

#OH MY ZSH:
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Bash-insulter:
sudo wget -O /etc/bash.command-not-found https://raw.githubusercontent.com/hkbakke/bash-insulter/master/src/bash.command-not-found


#Burp suite:
#sudo wget -O burp.sh https://portswigger.net/burp/releases/download?product=community&version=1.7.35&type=linux
#chmod +x burp.sh 
#source burp.sh

#Binwalk:
wget https://github.com/devttys0/binwalk/archive/master.zip
unzip master.zip
(cd binwalk-master && sudo python setup.py uninstall && sudo python setup.py install)
sudo source binwalk-master/deps.sh

#Gdb-peda:
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit

#QT:
wget http://download.qt.io/official_releases/qt/5.7/5.7.0/qt-opensource-linux-x64-5.7.0.run
chmod +x qt-opensource-linux-x64-5.7.0.run
./qt-opensource-linux-x64-5.7.0.run
sudo apt-get install build-essential libfontconfig1 mesa-common-dev
sudo apt-get install libglu1-mesa-dev -y

#Cutter:
git clone --recurse-submodules https://github.com/radareorg/cutter
cd cutter
source build.sh
cd ..

#python:
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py
sudo pip install scapy numpy Pillow beautifulsoup4


