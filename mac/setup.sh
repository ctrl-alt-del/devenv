#! /bin/bash
echo '==============='
echo 'Setup starts...'
echo '<<< Installing Homebrew...'
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
echo '>>> Homebrew has been successfully installed!'

echo '<<< Upgrading Git...'
git clone https://github.com/git/git
echo '>>> Git has been successfully upgraded!'

