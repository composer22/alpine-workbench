#!/bin/bash

set -eo pipefail

if [ ! -z "$LOG_LEVEL" ] && [ "$LOG_LEVEL" == "trace" ]
then
  set -xeo pipefail
fi

# Optional script included in consuming docker image for application.
[[ -e ./app-init.sh ]] && . ./app-init.sh

if [ ! -z "$LOG_LEVEL" ] && { [ "$LOG_LEVEL" == "debug" ] || [ "$LOG_LEVEL" == "trace" ] ; }
then
  echo "============== Environment =============="
  env | sort
  echo "========================================="
fi

# Stay alive forever awaiting requests.
export RESPONSE="HTTP/1.1 200 OK\r\nConnection: keep-alive\r\n\r\nOK\r\n"
while { echo -en "$RESPONSE"; } | nc -l -p "8080"; do
  echo "Request received."
done
