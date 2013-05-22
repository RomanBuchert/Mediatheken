#/bin/bash
#Masterscript für 500px.com
mkdir photo
mkdir pages

./getPopularList.sh
./genPhotoLinks.sh
./getPhotos.sh
