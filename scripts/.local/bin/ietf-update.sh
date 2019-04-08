#!/bin/sh

RFC_DIR="$HOME/.ietf"

RFC_INDEX_URL="https://www.rfc-editor.org/in-notes/rfc-index.txt"
RFC_URL_FSTRING="https://ietf.org/rfc/rfc%s.txt"

mkdir -p $RFC_DIR
cd $RFC_DIR

curl $RFC_INDEX_URL > rfc-index.txt

for i in $(grep -Po '^\d+' rfc-index.txt)
do
  if [ ! -f "$RFC_DIR/rfc$i.txt" ]
  then
    echo "Downloading RFC$i"
    curl $(printf $RFC_URL_FSTRING $i) > rfc$i.txt
  fi
done
