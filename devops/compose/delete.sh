#!/bin/sh

set -e

docker volume rm -f jmdsum_app_local
docker image rm -f jmdsum_app