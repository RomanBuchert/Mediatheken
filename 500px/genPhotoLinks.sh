#!/bin/bash
# Diese Datei erstellt eine Datei deren Inhalt die Adresse zu den Fotos auf 500px.com ist.

rm Fotos.tmp
rm Fotos.tmp2
for DATEI in `ls pages/*.html` ; do
  grep 3.jpg $DATEI | awk {'print $3'} | sed s/src=// >> Fotos.tmp
done
cat Fotos.tmp Fotos.txt | sed s/3.jpg/5.jpg/ >> Fotos.tmp2
cat Fotos.tmp2 | sort | uniq > Fotos.txt