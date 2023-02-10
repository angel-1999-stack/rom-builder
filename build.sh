#!/bin/bash

# Change to the Source Directory
cd $SYNC_PATH

# Set-up ccache
if [ -z "$CCACHE_SIZE" ]; then
    ccache -M 10G
else
    ccache -M ${CCACHE_SIZE}
fi


# Prepare the Build Environment
source build/envsetup.sh

# lunch the target
lunch lineage_lavender-user

# Build the Code
make bacon
