#! /bin/bash
echo '==============='
echo 'Setup starts...'
echo '<<< Installing Guake...'
sudo yum install guake
echo '>>> Guake has been successfully installed!'
echo ' '

echo '<<< Installing Zsh...'
sudo yum install zsh
echo '>>> Zsh has been successfully installed!'
echo ' '

echo '<<< Installing/Upgrading Git...'
sudo yum install git
echo '>>> Git has been successfully installed/upgraded!'
echo ' '

echo '<<< Installing Oh-My-Zsh...'
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`
echo '>>> Oh-My-Zsh has been successfully installed!'
echo ' '

echo '<<< Installing Sublime...'
os_ver=`getconf LONG_BIT`;
if [ $os_ver = 64 ] ; then
	echo '64-bit Operating System Detected...';
  wget http://c758482.r82.cf2.rackcdn.com/Sublime\ Text\ 2.0.2\ x64.tar.bz2
  tar vxjf Sublime\ Text\ 2.0.2\ x64.tar.bz2
  sudo rm -rf Sublime\ Text\ 2.0.2\ x64.tar.bz2
else
	echo '32-bit Operating System Detected...';
  wget http://c758482.r82.cf2.rackcdn.com/Sublime\ Text\ 2.0.2.tar.bz2
  tar vxjf Sublime\ Text\ 2.0.2.tar.bz2
  sudo rm -rf Sublime\ Text\ 2.0.2.tar.bz2
fi

sudo mv Sublime\ Text\ 2 /opt/sublime
sudo ln -s /opt/sublime/sublime_text /usr/bin/subl

echo '>>> Sublime has been successfully installed!'
echo ' '

echo '<<< Installing Oracle Java 7...'
cd /opt
wget http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz
sudo tar xvf jdk-7u79-linux-x64.tar.gz
sudo ln -s /opt/jdk-7u79-linux-x64/bin/java /usr/bin/java
sudo rm jdk-7u79-linux-x64.tar.gz
echo '>>> Oracle Java 7 has been successfully installed!'

echo '<<< Installing Node.js...'
sudo yum install nodejs nodejs-dev npm
echo '>>> Node.js has been successfully installed!'

echo '<<< Installing Curl...'
sudo yum install curl
echo '>>> Curl has been successfully installed!'

echo '<<< Setting up ~/.bash_profile...'
if [ ! -f ./setup_bash_profile.sh ] ; then
  \curl -O https://raw.githubusercontent.com/ctrl-alt-del/devenv/master/util/setup_bash_profile.sh
fi
sudo chmod 755 setup_bash_profile.sh
bash ./setup_bash_profile.sh
sudo rm setup_bash_profile.sh

echo '>>> ~/.bash_profile has been successfully created!'

echo '<<< Installing RVM, Ruby, and Rails...'
\curl -sSL https://get.rvm.io | bash -s stable --rails
echo '>>> RVM, Ruby, and Rails have been successfully installed!'

echo '<<< Configuring Ruby environment...'
rvm requirements
echo '>>> Ruby environment has been successfully configured!'

echo '<<< Configuring synclient...'
if [ ! -f ./setup_synclient.sh ] ; then
  \curl -O https://raw.githubusercontent.com/ctrl-alt-del/devenv/master/util/setup_synclient.sh
fi
sudo chmod 755 setup_synclient.sh
bash ./setup_synclient.sh
sudo rm setup_synclient.sh
echo '>>> synclient has been successfully configured!'

echo '<<< Installing gitg...'
sudo yum install gitg
echo '>>> gitg has been successfully installed!'

echo '<<< Installing pip...'
\curl -O https://bootstrap.pypa.io/get-pip.py
chmod 755 get-pip.py
sudo python get-pip.py
rm get-pip.py
echo '>>> pip has been successfully installed!'

echo '<<< Installing Django...'
sudo pip install django
echo '>>> Django has been successfully installed!'


