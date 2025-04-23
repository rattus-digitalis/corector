#!/bin/bash

FICHIER="$1"

if [ ! -e "$FICHIER" ]; then
  echo "Erreur : le fichier n'existe pas"
  exit 1
fi

if [[ "${FICHIER##*.}" != "c" ]]; then
  echo "Erreur : le fichier n'est pas un fichier .c"
  exit 1
fi

if [ ! -r "$FICHIER" ]; then
  echo "Erreur : fichier non lisible"
  exit 1
fi

if [ ! -s "$FICHIER" ]; then
  echo "Erreur : fichier vide"
  exit 1
fi

OWNER=$(stat -c "%U" "$FICHIER")
if [ -z "$OWNER" ]; then
  echo "Erreur : propriétaire invalide"
  exit 1
fi

echo "corector_reco : OK"
exit 0
