#/bin/bash
#Masterscript für 500px.com
if [ ! -d photo ]; then
  mkdir photo
fi

if [ ! -d pages ]; then
  mkdir pages
fi

./getPopularList.sh
./getEditorsList.sh
./genPhotoLinks.sh
./getPhotos.sh
