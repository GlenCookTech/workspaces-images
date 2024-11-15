#!/usr/bin/env bash
set -ex

# Install Protonmain Bridge

wget https://proton.me/download/bridge/protonmail-bridge_3.14.0-1_amd64.deb -O /tmp/protonbridge.deb
dpkg -i /tmp/protonbridge.deb

# Cleanup for app layer
chown -R 1000:0 $HOME
find /usr/share/ -name "icon-theme.cache" -exec rm -f {} \;
if [ -z ${SKIP_CLEAN+x} ]; then
  apt-get autoclean
  rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*
fi
