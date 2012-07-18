#!/bin/bash
echo $$ > alpha.pid
rm website.html
rm filme.txt

curl http://www.br.de/fernsehen/br-alpha/sendungen/alpha-centauri/alpha-centauri-videothek-videos100.html > website.html
cat website.html | grep "\"zum Video\"" | grep "href=\"/fernsehen/br-alpha/sendungen\/alpha-centauri" | cut -d \" -f 2 | sort > filme.txt

if [[ ! -d ./video ]] ; then
  echo "Videoverzeichnis nicht vorhanden, erstelle es..."
  mkdir video
fi;

for FILM in `cat filme.txt` ; do 
  FILMNAME=`basename $FILM .html | sed "s/alpha-centauri-//;s/^\-//"`
  echo $FILMNAME
  TMP=`curl http://www.br.de/$FILM 2>/dev/null | grep onclick | grep xml | cut -d \' -f 4`
  FILEURI=`curl http://www.br.de$TMP 2>/dev/null | grep '_B</fileName>' | sed 's_<fileName>mp4:e2/mir-live/__g; s_</fileName>__g'`
  if [[ ! -s video/$FILMNAME.mp4 ]] ; then
    curl http://cdn-storage.br.de/mir-live/$FILEURI.mp4 > ./video/$FILMNAME.mp4
  fi;
done
