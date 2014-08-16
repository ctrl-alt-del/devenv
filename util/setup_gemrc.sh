#!/bin/bash
write_to_file() {

     if [ ! -f ~/.gemrc ] ; then
         touch -pv ~/.gemrc
    fi

    content="
    install: --no-rdoc --no-ri
    update:  --no-rdoc --no-ri
    ";

    echo "$content" >> "$file";
}

# execute it
write_to_file
