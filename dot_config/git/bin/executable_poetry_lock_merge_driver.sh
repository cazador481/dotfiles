#!/bin/sh
cd `dirname $1` || exit
# Keep the version from the branch being merged

# Regenerate the lock file without updating the dependencies
poetry lock --no-update
