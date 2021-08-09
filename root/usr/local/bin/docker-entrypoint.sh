#!/usr/bin/env bash

. /etc/profile
. /usr/local/bin/docker-entrypoint-functions.sh

MYUSER="${APPUSER}"
MYUID="${APPUID}"
MYGID="${APPGID}"

AutoUpgrade
ConfigureUser

if [ "${1}" == 'deluge' ]; then
  DockLog "fix permissions on /config"
  chown -R "${MYUSER}":"${MYUSER}" /config
  chmod -R g+w /config

  RunDropletEntrypoint

  DockLog "Starting app: ${1}d"
  su-exec "${MYUSER}" deluged -c /config --loglevel=info
  DockLog "Starting app: ${1}-web"
  exec su-exec "${MYUSER}" deluge-web -c /config --loglevel=info 
else
  DockLog "Starting app: ${@}"
  exec "$@"
fi

