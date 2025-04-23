#!/bin/bash

FICHIER="$1"

if [ -z "$FICHIER" ]; then
  echo "Usage : ./run.sh fichier.c"
  exit 1
fi

./corector_reco.sh "$FICHIER" || exit 1
./corector_infosec.sh "$FICHIER" || exit 1
./corector_gcc.sh "$FICHIER" || exit 1
./corector_compare.sh "$FICHIER"
