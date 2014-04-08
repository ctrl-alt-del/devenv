#!/bin/bash
write_to_file() {

     # initialize a local var
     local file=".bash_profile"

     # check if file exists. If not, create it
     if [ ! -f "$file" ] ; then
         # if not create the file
         touch "$file"
     fi
     echo "## ==================== ##"$'\r' >> "$file";
     echo "## Colorize the ls output ##"$'\r' >> "$file";
     echo "alias ls='ls --color=auto'"$'\r' >> "$file";
     echo ""$'\r' >> "$file";
     echo "## Use a long listing format ##"$'\r' >> "$file";
     echo "alias ll='ls -la'"$'\r' >> "$file";
     echo ""$'\r' >> "$file";
     echo "## Show hidden files ##"$'\r' >> "$file";
     echo "alias l.='ls -d .* --color=auto'"$'\r' >> "$file";
     echo ""$'\r' >> "$file";
     echo "## a quick way to navigate within directory ##"$'\r' >> "$file";
     echo "alias ~='cd ~'"$'\r' >> "$file";
     echo "alias ..='cd ..'"$'\r' >> "$file";
     echo "alias ...='cd ../../../'"$'\r' >> "$file";
     echo "alias ....='cd ../../../../'"$'\r' >> "$file";
     echo "alias .....='cd ../../../../'"$'\r' >> "$file";
     echo "alias .4='cd ../../../../'"$'\r' >> "$file";
     echo "alias .5='cd ../../../../..'"$'\r' >> "$file";
     echo "alias ub='cd /c/usr/bin'"$'\r' >> "$file";
     echo "alias dk='cd ~/Desktop'"$'\r' >> "$file";
     echo "alias ss='cd ~/Sites'"$'\r' >> "$file";
     echo ""$'\r' >> "$file";
     echo "## Colorize the grep command output ##"$'\r' >> "$file";
     echo "alias grep='grep --color=auto'"$'\r' >> "$file";
     echo "alias egrep='egrep --color=auto'"$'\r' >> "$file";
     echo "alias fgrep='fgrep --color=auto'"$'\r' >> "$file";
     echo ""$'\r' >> "$file";
     echo ""$'\r' >> "$file";
     echo "## Generate sha1"$'\r' >> "$file";
     echo "alias sha1='openssl sha1'"$'\r' >> "$file";
     echo ""$'\r' >> "$file";
     echo "## Set vim as default editor "$'\r' >> "$file";
     echo "alias vi=vim"$'\r' >> "$file";
     echo "alias svi='sudo vi'"$'\r' >> "$file";
     echo "alias vis='vim \"+set si\"'"$'\r' >> "$file";
     echo "alias edit='vim'"$'\r' >> "$file";
     echo ""$'\r' >> "$file";
     echo "## Show open ports"$'\r' >> "$file";
     echo "alias ports='netstat -tulanp'"$'\r' >> "$file";
     echo ""$'\r' >> "$file";
     echo "## pass options to free ##"$'\r' >> "$file";
     echo "alias meminfo='free -m -l -t'"$'\r' >> "$file";
     echo ""$'\r' >> "$file";
     echo "## get top process using most memory"$'\r' >> "$file";
     echo "alias psmem='ps auxf | sort -nr -k 4'"$'\r' >> "$file";
     echo "alias psmem10='ps auxf | sort -nr -k 4 | head -10'"$'\r' >> "$file";
     echo ""$'\r' >> "$file";
     echo "## get top process using most cpu ##"$'\r' >> "$file";
     echo "alias pscpu='ps auxf | sort -nr -k 3'"$'\r' >> "$file";
     echo "alias pscpu10='ps auxf | sort -nr -k 3 | head -10'"$'\r' >> "$file";
     echo ""$'\r' >> "$file";
     echo "## Get cpu info ##"$'\r' >> "$file";
     echo "alias cpuinfo='lscpu'"$'\r' >> "$file";
     echo ""$'\r' >> "$file";
     echo "## get GPU ram ##"$'\r' >> "$file";
     echo "alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'"$'\r' >> "$file";
     echo ""$'\r' >> "$file";
     echo "## ==================== ##"$'\r' >> "$file";
 }

# execute it
write_to_file