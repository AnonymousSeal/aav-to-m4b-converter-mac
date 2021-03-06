#!/usr/bin/env bash

shopt -s extglob

activation_bytes=''

if ["$activation_bytes" = '']
then
  echo "open the file and fill in the activation bytes"
  echo "hint: you can find out the activation bytes connected to your audible account"
  echo "by uploading one of the aav files to the website https://audible-converter.ml/"
  exit
fi

function obtain_name(){
    exiftool $1 | egrep "^Short Title" | cut -c 35-
}

for f in ./audiobooks/*.aav; do
   title="$(obtain_name $f)"
   title="${title//[ ,.:-]/_}"
   title="${title//\'/}"
   title="${title//+(_)/_}"
   title="converted/$title.m4b"
   ffmpeg -y -activation_bytes $activation_bytes -i $f -map_metadata 0 \
   -c:v copy -disposition:v:0 attached_pic -id3v2_version 3 -codec:a copy $title
done
