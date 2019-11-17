#!/bin/bash

set -e

SECONDS=0
USER=$1

usage() {
	echo "Usage: $0 <user>"
	echo "<user> is the login name and folder name on the sonic website"
	echo "Deploy will convert all markdown files (in this directory) to html."
	echo "Deploy will then FTP all html, ico and css files to the sonic website."
	echo "(All files are copied into the <user>'s folder)"
	exit 1
}

if [ -z $USER ]; then
        usage
fi

echo "Converting markdown to HTML..."
find ./ -iname "*.md" -type f -exec sh -c 'pandoc -f gfm "${0}" -o "./$(basename ${0%.md}.html)"' {} \;

echo "FTP'ing content to ftp.sonic.net..."
duck -existing overwrite --upload ftps://${USER}@ftp.sonic.net/home/WWW_pages/${USER}/ ./*.html
duck -existing overwrite --upload ftps://${USER}@ftp.sonic.net/home/WWW_pages/${USER}/ ./*.ico
duck -existing overwrite --upload ftps://${USER}@ftp.sonic.net/home/WWW_pages/${USER}/ ./*.css

echo "Elapsed Time: $((($SECONDS / 60) % 60)):$(($SECONDS % 60))"
exit 0
