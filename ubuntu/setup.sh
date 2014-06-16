#! /bin/bash
echo '==============='
echo 'Setup starts...'
echo '<<< Installing/Upgrading Git...'
sudo apt-get upgrade git
echo '>>> Git has been successfully installed/upgraded!'

echo '<<< Installing/Upgrading OpenSSL...'
sudo apt-get upgrade openssl
echo '>>> OpenSSL has been successfully installed/upgraded!'

echo '<<< Installing OpenJDK 7...'
sudo apt-get install openjdk-7-jdk
echo '>>> OpenJDK 7 has been successfully installed!'