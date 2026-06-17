#!/usr/bin/env bash
set -euo pipefail
# Robustly determine JAVA_HOME in builder environments.
# Prefer java's own reported java.home; fall back to resolving the java binary.
if [ -z "${JAVA_HOME:-}" ]; then
  if command -v java >/dev/null 2>&1; then
    # Try to get java.home via java itself
    JAVA_HOME_CANDIDATE=$(java -XshowSettings:properties -version 2>&1 | awk -F= '/java.home/ {gsub(/^[ \t]+|[ \t]+$/,"",$2); print $2; exit}') || true
    if [ -n "$JAVA_HOME_CANDIDATE" ] && [ -x "$JAVA_HOME_CANDIDATE/bin/java" ]; then
      export JAVA_HOME="$JAVA_HOME_CANDIDATE"
      echo "Set JAVA_HOME=$JAVA_HOME (from java -XshowSettings)"
    else
      # Fallback: resolve symlinks of java binary and use parent dir
      JAVA_BIN=$(command -v java || true)
      if command -v readlink >/dev/null 2>&1; then
        # try to fully resolve path
        JAVA_BIN_REAL=$(readlink -f "$JAVA_BIN" 2>/dev/null || echo "$JAVA_BIN")
      else
        JAVA_BIN_REAL="$JAVA_BIN"
      fi
      if [ -n "$JAVA_BIN_REAL" ]; then
        if [[ "$JAVA_BIN_REAL" == */bin/java ]]; then
          export JAVA_HOME="$(dirname "$(dirname "$JAVA_BIN_REAL")")"
        else
          # If java binary is not under bin/, try its parent
          export JAVA_HOME="$(dirname "$JAVA_BIN_REAL")"
        fi
        echo "Set JAVA_HOME=$JAVA_HOME (from java binary)"
      else
        echo "Warning: java not found in PATH. Proceeding to run mvnw may fail."
      fi
    fi
  else
    echo "Warning: java not found in PATH. Proceeding to run mvnw may fail."
  fi
fi

# Verify that $JAVA_HOME/bin/java exists before running mvnw
if [ -n "${JAVA_HOME:-}" ] && [ ! -x "$JAVA_HOME/bin/java" ]; then
  echo "Error: JAVA_HOME is set to '$JAVA_HOME' but '$JAVA_HOME/bin/java' is not executable." >&2
  exit 1
fi

./mvnw -DskipTests package
