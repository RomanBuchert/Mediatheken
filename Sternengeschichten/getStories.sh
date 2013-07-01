#!/bin/bash
DATEI=sternengeschichten.files

curl http://feeds.feedburner.com/sternengeschichten | grep .mp3 | cut -d \" -f 2 > $DATEI

while read DATEINAME ;do
    NAME=`basename $DATEINAME`
    echo $NAME

    if [ ! -s mp3/$NAME ] ; then
        echo "Lade $NAME von $DATEINAME herunter"
        wget $DATEINAME -O mp3/$NAME > /dev/null 2>&1
    else
	echo "Datei $NAME existiert bereits"
    fi
done < $DATEI
