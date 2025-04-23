#!/bin/bash

FICHIER="$1"
CLEAN="clean_code.c"
DIFF_OUTPUT="diff.txt"

if [ -z "$FICHIER" ]; then
  echo "Usage : ./corector_compare.sh fichier.c"
  exit 1
fi

if [ ! -f "$FICHIER" ]; then
  echo "Fichier cible introuvable : $FICHIER"
  exit 1
fi

if [ ! -f "$CLEAN" ]; then
  echo "Fichier de référence introuvable : $CLEAN"
  exit 1
fi

diff -u "$CLEAN" "$FICHIER" > "$DIFF_OUTPUT"

if [ -s "$DIFF_OUTPUT" ]; then
  echo "Des différences ont été enregistrées dans $DIFF_OUTPUT"
else
  echo "Aucune différence avec le fichier propre"
  rm -f "$DIFF_OUTPUT"
fi
