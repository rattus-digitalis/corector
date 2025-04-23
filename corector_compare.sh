#!/bin/bash

FILE="$1"
REFERENCE="clean_code.c"
DIFF_OUTPUT="diff.txt"

if [ -z "$FILE" ]; then
  echo "Usage: ./corector_compare.sh file.c"
  exit 1
fi

if [ ! -f "$FILE" ]; then
  echo "Target file not found: $FILE"
  exit 1
fi

if [ ! -f "$REFERENCE" ]; then
  echo "Reference file not found: $REFERENCE"
  exit 1
fi

diff -u "$REFERENCE" "$FILE" > "$DIFF_OUTPUT"

if [ -s "$DIFF_OUTPUT" ]; then
  echo "Differences were found and saved to $DIFF_OUTPUT"
else
  echo "No differences compared to the clean reference"
  rm -f "$DIFF_OUTPUT"
fi
