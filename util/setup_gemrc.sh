#!/bin/bash
write_to_file() {

	if [ ! -f ~/.gemrc ] ; then
		touch ~/.gemrc
	fi

	echo "$1" >> ~/.gemrc;
}

content="
install: --no-rdoc --no-ri
update:  --no-rdoc --no-ri
";

# execute it
write_to_file "$content"
