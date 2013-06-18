#!/bin/bash
#Diese Datei läd die in der Datei Fotos.txt stehenden Bilder herunter
awk -F \/ {'print $4 ";" $5 ";" $0'} Fotos.txt | sort -n > Fotos.tmp


while read DATEI ;do
  NAME=`echo $DATEI | awk -F\; {'print $1'}`
  URL=`echo $DATEI | awk -F\; {'print $3'} | sed 's/\"//g'`
  
  if [ ! -s photo/$NAME.jpg ] ; then
    echo "Lade $NAME.jpg von $URL herunter"
    wget $URL -O photo/$NAME.jpg > /dev/null 2>&1
  else
    echo "Datei $NAME existiert bereits"
  fi
done < "Fotos.tmp"
rm Fotos.tmp
