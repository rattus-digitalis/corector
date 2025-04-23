#!/bin/bash

FICHIER="$1"
DOSSIER=$(dirname "$FICHIER")
EXEC_TMP="temp_exec_$$"
ERROR_FILE="$DOSSIER/error.txt"

gcc -Wall -Wextra -o "$EXEC_TMP" "$FICHIER" 2> "$ERROR_FILE"

if [ $? -eq 0 ]; then
  echo "corector_compile : compilation réussie"
  rm -f "$EXEC_TMP" "$ERROR_FILE"
  exit 0
else
  echo "corector_compile : échec de la compilation (voir $ERROR_FILE)"
  exit 1
fi
