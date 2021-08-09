#!/usr/bin/env bash

DELUGE_URL="https://dev.deluge-torrent.org/wiki/Download"

FULL_LAST_VERSION=$(curl -SsL ${DELUGE_URL} | grep Latest | sed -e "s/Latest Release: <strong>//")
LAST_VERSION="${FULL_LAST_VERSION}"

sed -i -e "s|DELUGE_VERSION='.*'|DELUGE_VERSION='${LAST_VERSION}'|" Dockerfile*

if output=$(git status --porcelain) && [ -z "$output" ]; then
  # Working directory clean
  echo "No new version available!"
else 
  # Uncommitted changes
  git commit -a -m "update to version: ${LAST_VERSION}"
  git push
fi
