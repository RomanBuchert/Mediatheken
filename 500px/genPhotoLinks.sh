#!/bin/bash
# Diese Datei erstellt eine Datei deren Inhalt die Adresse zu den Fotos auf 500px.com ist.

rm Fotos.tmp
rm Fotos.txt
for DATEI in `ls pages/*.html` ; do
  grep 3.jpg $DATEI | awk {'print $3'} | sed s/src=// >> Fotos.tmp
done
sort -t\/ -n -k 3 Fotos.tmp | sed s/3.jpg/5.jpg/ > Fotos.txt
rm Fotos.tmp
