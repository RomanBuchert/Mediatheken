#!/bin/bash
HIER=`pwd`
GENRE=$1
BASEURL=http://incompetech.com
URL=$BASEURL/music/royalty-free/index.html

if [ -z "$GENRE" ]; then
    echo "Bitte gültiges Genre angeben"
    echo "African"
    echo "Blues"
    echo "Classical"
    echo "Contemporary"
    echo "Disco"
    echo "Electronica"
    echo "Funk"
    echo "Holiday"
    echo "Horror"
    echo "Jazz"
    echo "Latin"
    echo "Modern"
    echo "Polka"
    echo "Pop"
    echo "Reggae"
    echo "Rock"
    echo "Silent Film Score"
    echo "Soundtrack"
    echo "Stings"
    echo "Unclassifiable"
    echo "World"
    exit
fi

# Hauptseite herunterladen und Anzahl der Zeiten ermitteln
wget "$URL?genre=$GENRE" -O tmp.html

if [ ! -e tmp.html ] ; then
    echo "Seite des Genres konnte nicht heruntergeladen werden"
    exit
fi;

SEITEN=`cat tmp.html | grep page\= | sed 's/\;/\n/g' | grep -c page\=`
echo "Seiten: $SEITEN"

#Verzeichnis des Genres erstellen
if [ ! -d "$GENRE" ]; then
    mkdir "$GENRE"
fi;

rm *.files
for (( CNTR = 0; CNTR <= $SEITEN; CNTR++ )); do
    wget "$URL?genre=$GENRE&page=$CNTR" -O files.html
    cat files.html | grep 'HREF=\"/music/royalty-free/mp3-royaltyfree/' | cut -d\" -f 44 >> tmp.files
done

sort tmp.files > "$GENRE.files"
rm tmp.files

#Dateinamen der MP3s ermitteln
for I in `cat "$GENRE".files`;  do
    TMPNAME=`basename $I`
    MP3NAME=`echo $TMPNAME | sed 's/\%20/ /g'`
#    echo TmpName: $TMPNAME
#    echo Mp3Name: $MP3NAME
    wget "$BASEURL/$I" -O "$GENRE/$MP3NAME"
#    echo BaseURL: "$BASEURL/$I" -O "$GENRE/$MP3NAME"
done

rm *.files
rm *.html
