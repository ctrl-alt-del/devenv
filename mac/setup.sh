#! /bin/bash
echo '==============='
echo 'Setup starts...'
echo '<<< Installing Homebrew...'
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
echo '>>> Homebrew has been successfully installed!'

echo '<<< Installing Git...'
brew install git
echo '>>> Git has been successfully installed!'

echo '<<< Installing Oh-My-Zsh...'
wget --no-check-certificate http://install.ohmyz.sh -O - | sh
echo '>>> Oh-My-Zsh has been successfully installed!'
echo ' '

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

echo '<<< Setting up ~/.gemrc...'
if [ ! -f ./setup_gemrc.sh ] ; then
  \curl -O https://raw.githubusercontent.com/ctrl-alt-del/devenv/master/util/setup_gemrc.sh
fi
chmod 755 setup_gemrc.sh
bash ./setup_gemrc.sh
rm setup_gemrc.sh
echo '>>> ~/.gemrc has been successfully created!'

echo '<<< Installing Node.js...'
brew install nodejs
echo '>>> Node.js has been successfully installed!'

echo '<<< Installing Gradle...'
brew install gradle
echo '>>> Gradle has been successfully installed!'

echo '<<< Installing Wget...'
brew install wget
echo '>>> Wget has been successfully installed!'

echo '<<< Installing Curl...'
brew install curl
echo '>>> Curl has been successfully installed!'

echo '<<< Installing Python...'
brew install python
echo '>>> Python has been successfully installed!'

echo '<<< Installing OpenSSL...'
brew install openssl
echo '>>> OpenSSL has been successfully installed!'

echo '<<< Installing SQLite...'
brew install sqlite3
echo '>>> SQLite has been successfully installed!'

