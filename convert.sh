#!/bin/bash
# Changes the gain and normalizes SvxLink-soundfiles
#
# you need the source directory of the original sound files 
# (from github) and the target directoriy that Svxlink uses
#
# 11th Feb 2024 Adi/ DL1HRC

gain=-2
norm=-0.1

source_dir=/home/pi/svxlink-sounds-de_DE-petra
destination_dir=/usr/share/svxlink/sounds/de_DE/

####################################################################

for entry in $(ls $source_dir)
  do
    for files in "$source_dir/$entry"/*.wav
      do
       file=${files##*/}
       echo "$files -> $destination_dir$entry/$file"
       sox "$files" "$destination_dir$entry/$file" gain $gain norm $norm 
    done
  done
