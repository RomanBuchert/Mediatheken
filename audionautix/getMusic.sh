#!/bin/bash
HIER=`pwd`
GENRE=$1
BASEURL=http://audionautix.com
URL=$BASEURL/index.php

if [ -z "$GENRE" ]; then
   echo "Bitte gültiges Genre angeben"
   echo "Blues"
   echo "Country"
   echo "Dance"
   echo "Easy-Listening"
   echo "Electronic"
   echo "Folk"
   echo "Gothic-Rock"
   echo "Hip-Hop"
   echo "Jazz"
   echo "Jazz_Funk"
   echo "Meditative"
   echo "Other"
   echo "Pop/Funk"
   echo "Punk-Rock"
   echo "Reggae"
   echo "Rock"
   echo "Soundtrack"
   echo "Symphony"
   echo "Techno"
   echo "Top-40"
   exit
fi

#Verzeichnis des Genres erstellen
if [ ! -d "$GENRE" ]; then
    mkdir "$GENRE"
fi;

rm *.files
wget "$URL?genre=$GENRE" -O files.html
cat files.html | grep span | grep 'href=\"/Music' | cut -d\" -f 6 >> tmp.files

sort tmp.files > "$GENRE".files
rm tmp.files

#Dateinamen der MP3s ermitteln
for I in `cat "$GENRE".files`;  do
    TMPNAME=`basename $I`
    MP3NAME=`echo $TMPNAME | sed 's/\%20/ /g'`
    wget "$BASEURL/$I" -O "$GENRE/$MP3NAME"
    #echo $GENRE/$MP3NAME
done
rm *.files
rm *.html
