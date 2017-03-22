#! /usr/bin/bash
prefix="" # prefix of interest, avoid space
for file in `ls -I "*.sh"` # list all file except bash files
do
	[ -e "$file" ] || continue # skip on error
	if [ -f "$file" ] # is a file
		then
		mv "$file" "$prefix$file"
	fi
done