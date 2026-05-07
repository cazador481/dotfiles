#!/bin/sh
cd `dirname $1` || exit
# Keep the version from the branch being merged

# Regenerate the lock file without updating the dependencies
git checkout --theirs poetry.lock
make -o setup poetry -- lock
