#!/bin/bash
set -e

### Configuration ###

APP_DIR=test-app-dep
GIT_URL=https://github.com/shanti-nb/test-app-dep.git
RESTART_ARGS=

# Uncomment and modify the following if you installed Passenger from tarball
#export PATH=/path-to-passenger/bin:$PATH


### Automation steps ###

set -x

# Pull latest code
if [[ -e $APP_DIR ]]; then
  cd $APP_DIR
  git pull
else
  git clone $GIT_URL
  cd $APP_DIR
fi

# Install dependencies
npm install --production
npm prune --production

# Restart app
ssh ubuntu@54.251.10.54 "source ~/.nvm/nvm.sh && cd test-app-dep && git pull origin main && npm ci && pm2 restart 15"