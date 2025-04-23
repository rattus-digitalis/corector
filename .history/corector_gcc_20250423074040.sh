#!/bin/bash

FILE="$1"
DIR=$(dirname "$FILE")
EXEC_TMP="temp_exec_$$"
ERROR_FILE="$DIR/error.txt"

gcc -Wall -Wextra -o "$EXEC_TMP" "$FILE" 2> "$ERROR_FILE"

if [ $? -eq 0 ]; then
  echo "corector_compile: compilation successful"
  rm -f "$EXEC_TMP" "$ERROR_FILE"
  exit 0
else
  echo "corector_compile: compilation failed (see $ERROR_FILE)"
  exit 1
fi
