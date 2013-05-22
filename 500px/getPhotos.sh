#!/bin/bash
#Diese Datei läd die in der Datei Fotos.txt stehenden Bilder herunter

while read DATEI ;do
  NAME=`echo $DATEI | sed 's/\// /g' | awk {'print $3'}`
  URL=`echo $DATEI | sed s/\"//g`
  if [ ! -s photo/$NAME.jpg ] ; then
    echo Link: $URL \;Dateiname: $NAME.jpg
    wget $URL -O photo/$NAME.jpg
  else
    echo "Datei $NAME existiert bereits"
  fi
done < "Fotos.txt"

