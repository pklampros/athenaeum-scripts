#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "At least one argument is required to set the container id (for different persistent storages)"
    exit 1
fi

PERSISTENT_DATA_ID=$1

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PROJECT_DIR="$SCRIPT_DIR/../../"

PROJECT_DIR=$(echo "$(cd "$(dirname -- "$1")" >/dev/null; pwd -P)/$(basename -- "$PROJECT_DIR")")

PERSISTENT_DATA_DIR="$PROJECT_DIR/.nosync/persistent_data/$PERSISTENT_DATA_ID"
rm -rf "$PERSISTENT_DATA_DIR"
