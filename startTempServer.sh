#!/bin/bash

# Runs a nextcloud container for testing
# data only exists in the container, so new every time

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PROJECT_DIR="$SCRIPT_DIR/../../"

PROJECT_DIR=$(echo "$(cd "$(dirname -- "$1")" >/dev/null; pwd -P)/$(basename -- "$PROJECT_DIR")")

podman run --name=nextcloud --replace=true -p 8081:80 \
  -v "$PROJECT_DIR/code/apps/":"/var/www/html/custom_apps" \
  nextcloud-athenaeum:25
