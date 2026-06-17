#!/usr/bin/env bash
set -euo pipefail
# Find java and set JAVA_HOME for environments where it's not set correctly
if [ -z "${JAVA_HOME:-}" ]; then
  JAVA_BIN=$(command -v java || true)
  if [ -n "$JAVA_BIN" ]; then
    export JAVA_HOME=$(dirname "$(dirname "$JAVA_BIN")")
    echo "Set JAVA_HOME=$JAVA_HOME"
  else
    echo "Warning: java not found in PATH. Proceeding to run mvnw may fail."
  fi
fi
./mvnw -DskipTests package
