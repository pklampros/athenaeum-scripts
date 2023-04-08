#!/bin/bash

# Runs a nextcloud container for testing
# data remains in a local directory and is thus persistent

if [ "$#" -ne 1 ]; then
    echo "At least one argument is required to set the container id (for different persistent storages)"
    exit 1
fi

get_abs_filename() {
  # $1 : relative filename
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

PERSISTENT_DATA_ID=$1

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PROJECT_DIR="$SCRIPT_DIR/../../"
PROJECT_DIR=$(get_abs_filename "$PROJECT_DIR")

PERSISTENT_DATA_DIR="$PROJECT_DIR/.nosync/persistent_data/$PERSISTENT_DATA_ID"
mkdir -p "$PERSISTENT_DATA_DIR"

# cd "$SCRIPT_DIR/server"

# see ./buildImage.sh for details on this container
podman run --name=nextcloud --replace=true -p 8081:80 \
  -v "$PERSISTENT_DATA_DIR":"/var/www/html" \
  -v "$PROJECT_DIR/code/apps/":"/var/www/html/custom_apps" \
  nextcloud-athenaeum:25
  
  
  
