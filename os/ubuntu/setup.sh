#! /bin/bash
echo '==============='
echo 'Setup starts...'
echo '<<< Upgrading Ubuntu...'
sudo add-apt-repository ppa:webupd8team/atom
sudo add-apt-repository ppa:webupd8team/sublime-text-2
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get safe-upgrade
echo ' '

echo '<<< Installing Tools...'
sudo apt-get install git zsh guake vim htop tree sublime-text atom openssl oracle-java8-installer 2>/dev/null
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
echo ' '

echo '<<< Installing Node.js...'
sudo apt-get install nodejs nodejs-dev npm 2>/dev/null
echo '>>> Node.js has been successfully installed!'

echo '<<< Installing Curl...'
sudo apt-get install curl 2>/dev/null
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

echo '<<< Setting up ~/.gemrc...'
if [ ! -f ./setup_gemrc.sh ] ; then
  \curl -O https://raw.githubusercontent.com/ctrl-alt-del/devenv/master/util/setup_gemrc.sh
fi
sudo chmod 755 setup_gemrc.sh
bash ./setup_gemrc.sh
sudo rm setup_gemrc.sh
echo '>>> ~/.gemrc has been successfully created!'

echo '<<< Configuring synclient...'
if [ ! -f ./setup_synclient.sh ] ; then
  \curl -O https://raw.githubusercontent.com/ctrl-alt-del/devenv/master/util/setup_synclient.sh
fi
sudo chmod 755 setup_synclient.sh
bash ./setup_synclient.sh
sudo rm setup_synclient.sh
echo '>>> synclient has been successfully configured!'

echo '<<< Installing dkms...'
sudo apt-get install dkms 2>/dev/null
echo '>>> dkms has been successfully installed!'

echo '<<< Installing gitg...'
sudo apt-get install gitg 2>/dev/null
echo '>>> gitg has been successfully installed!'

echo '<<< Installing pip...'
\curl -O https://bootstrap.pypa.io/get-pip.py
chmod 755 get-pip.py
sudo python get-pip.py
rm get-pip.py
echo '>>> pip has been successfully installed!'

echo '<<< Installing Django...'
sudo pip install django 2>/dev/null
echo '>>> Django has been successfully installed!'
