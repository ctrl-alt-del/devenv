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

# install oh-my-zsh
# config oh-my-zsh chsh -s 'which zsh'

echo '<<< Installing/Upgrading Git...'
sudo yum install git-core
echo '>>> Git has been successfully installed/upgraded!'
echo ' '

echo '<<< Installing Gitk...'
sudo yum install gitk
echo '>>> Gitk has been successfully installed!'

echo '<<< Installing OpenJDK 7...'
sudo yum install openjdk-7-jdk
echo '>>> OpenJDK 7 has been successfully installed!'

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
chmod 755 setup_bash_profile.sh
bash ./setup_bash_profile.sh
rm setup_bash_profile.sh

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
chmod 755 setup_synclient.sh
bash ./setup_synclient.sh
rm setup_synclient.sh
echo '>>> synclient has been successfully configured!'
