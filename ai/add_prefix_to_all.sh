#! /usr/bin/bash
prefix=""
for file in `ls -I "*.sh"`
do
	[ -e "$file" ] || continue
	if [ -f "$file" ]
		then
		mv "$file" "$prefix$file"
	fi
done