#!/bin/bash
set -e

### Configuration ###

SERVER=ubuntu@54.251.10.54
APP_DIR=/var/www/myapp
KEYFILE=
# REMOTE_SCRIPT_PATH=/tmp/deploy-myapp.sh


### Library ###

function run()
{
  echo "Running: $@"
  "$@"
}


### Automation steps ###

if [[ "$KEYFILE" != "" ]]; then
  KEYARG="-i $KEYFILE"
else
  KEYARG=
fi

run scp $KEYARG deploy/work.sh $SERVER
echo
echo "---- Running deployment script on remote server ----"
run ssh $KEYARG $SERVER bash 