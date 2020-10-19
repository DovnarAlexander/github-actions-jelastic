#!/bin/sh

set -e
response=$(/cli/entrypoint.sh "$*")
echo "::set-output name=output::$response"
