#!/bin/bash
# Diese Datei läd alle Links zu Fotos auf der Seite 500px.com herunter

KATEGORIE=popular

for (( SEITE = 1 ; SEITE < 5000 ; SEITE++ )) ; do
  wget http://www.500px.com/photos?page=$SEITE -O ./pages/$KATEGORIE$SEITE.html >/dev/null 2>&1
  grep "next_page disabled" ./pages/$KATEGORIE$SEITE.html
  ERGEBNIS=$?
  if [ $ERGEBNIS != 1 ] ; then
    exit 1
  fi
done

