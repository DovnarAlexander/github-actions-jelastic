#!/bin/sh

set -e
# To overwrite GitHub run command
export HOME=/cli

cd $HOME
response=$(/cli/entrypoint.sh "$*" | jq --compact-output)
echo "::set-output name=output::$response"
