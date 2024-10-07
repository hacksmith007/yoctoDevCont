#!/bin/bash

# Note : When we mount a volume to docker container and we log in to the container as non-root user then we don't have R/W permissions.

# Wait to ensure the environment is fully ready (optional, but can help with timing issues)
sleep 3

# Ensure the directory exists
if [ -d "/workspaces/yocto" ]; then
    echo "Changing ownership of /workspaces/yocto to vsuser:containergroup"
    chown -R vsuser:containergroup /workspaces/yocto
else
    echo "Directory /workspaces/yocto does not exist. Creating it now."
    mkdir -p /workspaces/yocto
    chown -R vsuser:containergroup /workspaces/yocto
fi

# Print success message
echo "Ownership changed to vsuser:containergroup"

tail -f /dev/null