#! /bin/bash
echo '==============='
echo 'Setup starts...'
echo '<<< Installing Homebrew...'
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
echo '>>> Homebrew has been successfully installed!'

echo '<<< Upgrading Git...'
git clone https://github.com/git/git
echo '>>> Git has been successfully upgraded!'

echo '<<< Setting up ~/.bash_profile...'
if [ ! -f ./setup_bash_profile.sh ] ; then
  \curl -O https://raw.githubusercontent.com/ctrl-alt-del/devenv/master/util/setup_bash_profile.sh
fi
chmod 755 setup_bash_profile.sh
bash ./setup_bash_profile.sh
rm setup_bash_profile.sh
echo '>>> ~/.bash_profile has been successfully created!'

echo '<<< Installing RVM and Ruby...'
\curl -sSL https://get.rvm.io | bash -s stable --ruby
echo '>>> RVM and Ruby has been successfully installed!'

echo '<<< Configuring Ruby environment...'
rvm requirements
echo '>>> Ruby environment has been successfully configured!'

echo '<<< Installing Rails...'
gem install rails
echo '>>> Rails has been successfully installed!'
