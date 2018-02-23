#!/bin/bash

# Stay alive forever awaiting requests.
export RESPONSE="HTTP/1.1 200 OK\r\nConnection: keep-alive\r\n\r\nOK\r\n"
while { echo -en "$RESPONSE"; } | nc -l -p "8080"; do
  echo "Request received."
done
