#!/bin/bash
curl "http://www.zdf.de/ZDFmediathek/kanaluebersicht/aktuellste/925180?teaserListIndex=1000&bc=saz;saz3;kua925180&flash=off" | grep beitrag | grep href | cut -d\" -f2 | grep flash=off | sort | uniq > videos.txt
