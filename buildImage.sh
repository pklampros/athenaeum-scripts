#!/bin/bash

# It's necessary to modify the default docker image because
# we need the php mailparse extension

podman build -t nextcloud-athenaeum:25 \
--build-arg PHP_EXTRA_CONFIGURE_ARGS="--enable-mailparse" \
-<< EOF
FROM docker.io/library/nextcloud:25
RUN pecl install mailparse && docker-php-ext-enable mailparse
EOF
