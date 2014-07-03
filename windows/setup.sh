#! /bin/bash
# execture the setup_bash_profile file to generate ~/.bash_profile
echo '==============='
echo 'Setup starts...'
echo '<<< Setting up ~/.bash_profile...'
local file="setup_bash_profile"
if [ -f "$file" ] ; then
    ./setup_bash_profile
    echo '>>> ~/.bash_profile has been successfully created!'
fi

