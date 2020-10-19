#!/bin/sh

set -e

cd /cli
response=$(/cli/entrypoint.sh "$*")
echo "::set-output name=output::$response"
