#!/bin/bash
set -e

### Configuration ###

SERVER=ubuntu@54.251.10.54
APP_DIR=/var/www/test-app-dep
KEYFILE=
REMOTE_SCRIPT_PATH=/tmp/test-app-dep.sh


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
# ssh ubuntu@54.251.10.54 "source ~/.nvm/nvm.sh && cd test-app-dep && git pull origin main && npm ci && pm2 start npm --name my_app_demo -- start"

ssh ubuntu@54.251.10.54 "source ~/.nvm/nvm.sh && cd test-app-dep && git pull origin main && npm ci && pm2 start npm --name my_app_demo -- start"