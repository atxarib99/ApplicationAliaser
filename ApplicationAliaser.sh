#!/bin/bash

#where to output the alias commands
BASHALIAS="/etc/bashrc"

#for each file in applications
for filename in /Applications/*.app; do
	#get the filename, and remove the absolute path, count characters
	filenamelen=$((${#filename}-18))
	#remove the .app
	a=${filename:14:$filenamelen}
	#remove spaces
	alname=$( echo "${a// /}" | tr '[:upper:]' '[:lower:]')
	#echo what alias will be creates
	echo "alias created ${alname}"
	#echo the actual alias command to the alias location
	echo "alias ${alname}=\"open $filename\"" >> $BASHALIAS
done
