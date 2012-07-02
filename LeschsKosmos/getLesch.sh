#!/bin/bash

echo $$ >getLesch.pid
rm video.txt
rm tmpStreams.txt

./getVideoList.sh

<<<<<<< HEAD
if [[ ! -d ./video ]] ; then
	echo "Videoverzeichnis nicht vorhanden, erstelle es..."
	mkdir video
fi;
=======
>>>>>>> d821c34249e82cdf051b1c0a2d5a8e9759f1c09c

for I in `cat videos.txt` ; do
	FILENAME=`basename "$I" | cut -d ? -f1`
	STREAMFILE=`curl "www.zdf.de$I" 2>/dev/null | grep asx | grep veryhigh | cut -d\" -f2`
	STREAM=`curl $STREAMFILE 2>/dev/null | grep mms: | cut -d\" -f2`
	echo -e -n "$FILENAME ist gespeichert unter $STREAMFILE \n"
	echo -e -n "URL des Streams: $STREAM \n"
	if [[ ! -s video/$FILENAME.wmv ]] ; then
		mplayer -dumpstream -dumpfile video/$FILENAME.wmv $STREAM
	fi;
done

	
