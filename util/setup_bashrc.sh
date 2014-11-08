#!/bin/bash
write_to_file() {

	if [ ! -f ~/.bashrc ] ; then
		touch ~/.bashrc
	fi

	echo "$1" >> ~/.bashrc;
}

content="
source \$HOME/.rvm/scripts/rvm
";

# execute it
write_to_file "$content"
