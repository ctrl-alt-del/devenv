#! /bin/bash
# execture the setup_bash_profile file to generate ~/.bash_profile
echo '==============='
echo 'Setup starts...'

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
