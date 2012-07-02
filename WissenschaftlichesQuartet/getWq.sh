#!/bin/bash

rm filme.txt
echo "Hole Filmliste..."
curl http://www.wq-tv.de/downloads.html | grep -i .zip | cut -d '"' -f 4 >> filme.txt
echo "Filmliste geholt!"

<<<<<<< HEAD
if [[ ! -d ./video ]] ; then
    echo "Videoverzeichnis nicht vorhanden, erstelle es..."
    mkdir ./video
fi;

=======
>>>>>>> d821c34249e82cdf051b1c0a2d5a8e9759f1c09c
for I in `cat filme.txt` ; do
	FILENAME=`basename $I`
	echo "Archiv ist gespeichert unter www.wq-tv.de$I, Archivname ist \"$FILENAME\""
	if [[ ! -s video/$FILENAME ]] ; then
	    echo "Archiv $FILENAME existiert noch nicht, lade es herunter..."
	    rm $FILENAME >/dev/null 2>&1
	    wget www.wq-tv.de$I
	    mv $FILENAME video/
	else
	    echo "Archiv \"$FILENAME\" ist bereits vorhanden"
	fi;
done;
