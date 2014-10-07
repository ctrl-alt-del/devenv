#!/bin/bash
write_to_file() {

     # check if file exists. If not, create it
     if [ ! -f ~/.profile ] ; then
         # if not create the file
         touch ~/.profile
    fi

    content="
    ## ==================== ##

    ## ==================== ##

    ";

    echo "$content" >> ~/.profile;
}

# execute it
write_to_file
