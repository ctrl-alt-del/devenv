#! /bin/bash
echo '==============='
echo 'Setup starts...'
echo '<<< Installing Guake...'
sudo apt-get install guake
echo '>>> Guake has been successfully installed!'
echo ' '

echo '<<< Installing/Upgrading Git...'
sudo apt-get install git-core
echo '>>> Git has been successfully installed/upgraded!'
echo ' '

echo '<<< Installing Sublime...'
sudo add-apt-repository ppa:webupd8team/sublime-text-2
sudo apt-get update
echo '>>> Sublime has been successfully installed!'

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

echo '<<< Setting up ~/.bash_profile...'
local file="setup_bash_profile"
if [ -f "$file" ] ; then
    bash ../util/setup_bash_profile.sh
    echo '>>> ~/.bash_profile has been successfully created!'
fi

echo '<<< Installing RVM and Ruby...'
\curl -sSL https://get.rvm.io | bash -s stable --ruby
echo '>>> RVM and Ruby has been successfully installed!'

echo '<<< Configuring Ruby environment...'
rvm requirements
echo '>>> Ruby environment has been successfully configured!'

echo '<<< Installing Rails...'
gem install rails
echo '>>> Rails has been successfully installed!'