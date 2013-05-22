#!/bin/bash
# Diese Datei läd alle Links zu Fotos auf der Seite 500px.com herunter

for (( SEITE = 1 ; SEITE < 1000 ; SEITE++ )) ; do
  wget http://www.500px.com/photos?page=$SEITE -O ./pages/page$SEITE.html
done

