#!/usr/bin/env bash

LIBTORRENT_URL="https://api.github.com/repos/arvidn/libtorrent/tags"

FULL_LAST_VERSION=$(curl -SsL ${LIBTORRENT_URL} | jq .[0].name -r)
LAST_VERSION="${FULL_LAST_VERSION:1}"

sed -i -e "s|LIBTORRENT_VERSION='.*'|LIBTORRENT_VERSION='${LAST_VERSION}'|" Dockerfile*

if output=$(git status --porcelain) && [ -z "$output" ]; then
  # Working directory clean
  echo "No new version available!"
else 
  # Uncommitted changes
  git commit -a -m "update to version: ${LAST_VERSION}"
  git push
fi
