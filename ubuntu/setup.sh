#! /bin/bash
echo '==============='
echo 'Setup starts...'
echo '<<< Installing Tilda...'
sudo apt-get install tilda
echo '>>> Tilda has been successfully installed!'

echo '<<< Installing Sublime...'
sudo add-apt-repository ppa:webupd8team/sublime-text-2
sudo apt-get update
echo '>>> Sublime has been successfully installed!'

echo '<<< Installing/Upgrading Git...'
sudo apt-get upgrade git
echo '>>> Git has been successfully installed/upgraded!'

echo '<<< Installing Gitk...'
sudo apt-get install gitk
echo '>>> Gitk has been successfully installed!'

echo '<<< Installing/Upgrading OpenSSL...'
sudo apt-get upgrade openssl
echo '>>> OpenSSL has been successfully installed/upgraded!'

echo '<<< Installing OpenJDK 7...'
sudo apt-get install openjdk-7-jdk
echo '>>> OpenJDK 7 has been successfully installed!'

echo '<<< Installing Node.js...'
sudo apt-get install nodejs
echo '>>> Node.js has been successfully installed!'