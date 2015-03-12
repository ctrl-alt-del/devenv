#! /bin/bash
echo '==============='
echo 'Setup starts...'
echo '<<< Upgrading Ubuntu...'
sudo apt-get update
sudo apt-get safe-upgrade
echo '>>> Ubuntu has been successfully upgraded!'
echo ' '

echo '<<< Installing Guake...'
sudo apt-get install guake 2>/dev/null 
echo '>>> Guake has been successfully installed!'
echo ' '

echo '<<< Installing vim...'
sudo apt-get install vim 2>/dev/null 
echo '>>> vim has been successfully installed!'
echo ' '

echo '<<< Installing/Upgrading Git...'
sudo apt-get install git 2>/dev/null 
echo '>>> Git has been successfully installed/upgraded!'
echo ' '

echo '<<< Installing oh-my-zsh...'
sudo apt-get install zsh 2>/dev/null 
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
sudo chsh -s /usr/bin/zsh
echo '>>> oh-my-zsh has been successfully installed!'
echo ' '

# install oh-my-zsh
# config oh-my-zsh chsh -s 'which zsh'

echo '<<< Installing Sublime...'
sudo add-apt-repository ppa:webupd8team/sublime-text-2
sudo apt-get update
sudo apt-get install sublime-text 2>/dev/null 
echo '>>> Sublime has been successfully installed!'
echo ' '

echo '<<< Installing/Upgrading OpenSSL...'
sudo apt-get upgrade openssl
echo '>>> OpenSSL has been successfully installed/upgraded!'

echo '<<< Installing OpenJDK 7...'
sudo apt-get install openjdk-7-jdk 2>/dev/null 
echo '>>> OpenJDK 7 has been successfully installed!'

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


