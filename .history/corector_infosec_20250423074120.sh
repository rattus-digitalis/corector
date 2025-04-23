#!/bin/bash

FILE="$1"

SUSPICIOUS_PATTERNS=(
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

for PATTERN in "${SUSPICIOUS_PATTERNS[@]}"; do
  if grep -E -q "$PATTERN" "$FILE"; then
    echo "corector_infosec: suspicious code detected ($PATTERN)"
    exit 1
  fi
done

echo "corector_infosec: OK"
exit 0
