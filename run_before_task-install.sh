#!/bin/sh
# Installs taskfile
set -eu

sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b "$HOME/bin"

