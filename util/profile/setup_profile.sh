#!/bin/bash
write_to_file() {

  # check if file exists. If not, create it
  if [ ! -f ~/.profile ] ; then
    # if not create the file
    touch ~/.profile
  fi

  echo "$1" >> ~/.profile;
}

content="

source \$HOME/.rvm/scripts/rvm

";

# execute it
write_to_file "$content"
