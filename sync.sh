#!/bin/bash

# Make the Directory if it doesn't exist
mkdir -p $SYNC_PATH

# Change to the Source Directory
cd $SYNC_PATH

# Init Repo
mkdir -p ~/.bin
PATH="${HOME}/.bin:${PATH}"
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.bin/repo
chmod a+rx ~/.bin/repo
repo init --depth=1 -u $MANIFEST -b $MANIFEST_BRANCH
git clone $LOCAL_MANIFEST --depth 1 -b $LOCALMANIFEST_BRANCH .repo/local_manifests

# Sync the Sources
repo sync -j$(nproc --all) --force-sync --no-tags --no-clone-bundle

# Exit
exit 0
