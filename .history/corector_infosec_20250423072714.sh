#!/bin/bash

FICHIER="$1"

MOTIFS_SUSPECTS=(
  "system *\\("
  "fork *\\("
  "exec[a-z]* *\\("
  "popen *\\("
  "/bin/sh"
  "/dev/mem"
  "/proc/"
  "fopen *\\(.*\"/etc/passwd"
  "fopen *\\(.*\"/etc/shadow"
  "chown *\\("
  "chmod *\\("
  "setuid *\\("
  "setgid *\\("
  "kill *\\("
  "socket *\\("
  "connect *\\("
  "#include *<unistd.h>"
  "#include *<sys/types.h>"
  "#include *<sys/wait.h>"
  "#include *<netinet/in.h>"
  "#include *<arpa/inet.h>"
  "strcpy *\\(.*, *argv\\["
  "strcat *\\(.*, *argv\\["
  "sprintf *\\(.*, *argv\\["
  "printf *\\(.*argv\\["
)

for MOTIF in "${MOTIFS_SUSPECTS[@]}"; do
  if grep -E -q "$MOTIF" "$FICHIER"; then
    echo "corector_infosec : code suspect détecté ($MOTIF)"
    exit 1
  fi
done

echo "corector_infosec : OK"
exit 0
