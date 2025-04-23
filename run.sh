#!/bin/bash

FILE="$1"

if [ -z "$FILE" ]; then
  echo "Usage: ./run.sh file.c"
  exit 1
fi

./corector_reco.sh "$FILE" || exit 1
./corector_infosec.sh "$FILE" || exit 1
./corector_gcc.sh "$FILE" || exit 1
./corector_compare.sh "$FILE"
