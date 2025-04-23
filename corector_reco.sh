#!/bin/bash

FILE="$1"

if [ ! -e "$FILE" ]; then
  echo "Error: file does not exist"
  exit 1
fi

if [[ "${FILE##*.}" != "c" ]]; then
  echo "Error: file is not a .c source file"
  exit 1
fi

if [ ! -r "$FILE" ]; then
  echo "Error: file is not readable"
  exit 1
fi

if [ ! -s "$FILE" ]; then
  echo "Error: file is empty"
  exit 1
fi

OWNER=$(stat -c "%U" "$FILE")
if [ -z "$OWNER" ]; then
  echo "Error: invalid file owner"
  exit 1
fi

echo "corector_reco: OK"
exit 0
