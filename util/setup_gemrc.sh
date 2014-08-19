#!/bin/bash
write_to_file() {

     if [ ! -f ~/.gemrc ] ; then
         touch ~/.gemrc
    fi

    content="
    install: --no-rdoc --no-ri
    update:  --no-rdoc --no-ri
    ";

    echo "$content" >> ~/.gemrc;
}

# execute it
write_to_file
