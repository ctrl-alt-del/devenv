#!/bin/bash
write_to_file() {

  # check if file exists. If not, create it
  if [ ! -f ~/.bash_profile ] ; then
    # if not create the file
    touch ~/.bash_profile
  fi

  echo "$1" >> ~/.bash_profile;
}

content="
## ==================== ##
## Colorize the ls output ##
alias ls='ls --color=auto'

## Use a long listing format ##
alias ll='ls -la'

## Show hidden files ##
alias l.='ls -d .* --color=auto'

## a quick way to navigate within directory ##
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias ub='cd /usr/bin'
alias dk='cd ~/Desktop'
alias ss='cd ~/Sites'

## Colorize the grep command output ##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


## Generate sha1
alias sha1='openssl sha1'

## Set vim as default editor
alias vi=vim
alias svi='sudo vi'
alias vis='vim \"+set si\"'
alias edit='vim'

## Show open ports
alias ports='netstat -tulanp'

## pass options to free ##
alias meminfo='free -m -l -t'

## get top process using most memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process using most cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

## Get cpu info ##
alias cpuinfo='lscpu'

## get GPU ram ##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

## keep the Ruby console program (irb) minimal
alias irb='irb --simple-prompt'
## ==================== ##

";

# execute it
write_to_file "$content"
