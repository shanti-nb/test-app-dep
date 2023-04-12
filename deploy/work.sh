#!/bin/bash
set -e

### Configuration ###

APP_DIR=/var/www/test-app-dep
GIT_URL=https://github.com/shanti-nb/test-app-dep.git
RESTART_ARGS=npm run start

# Uncomment and modify the following if you installed Passenger from tarball
#export PATH=/path-to-passenger/bin:$PATH


### Automation steps ###

set -x

# Pull latest code
if [[ -e test-app-dep ]]; then
  cd test-app-dep
  git pull
else
  git clone https://github.com/shanti-nb/test-app-dep.git test-app-dep
  cd test-app-dep
fi

# Install dependencies
npm install --production
npm prune --production

# Restart app
restart-app --ignore-app-not-running --ignore-passenger-not-running $RESTART_ARGS 