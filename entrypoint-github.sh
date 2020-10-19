#!/bin/sh

set -e
# To overwrite GitHub run command
export HOME=/cli

cd $HOME
response=$(/cli/entrypoint.sh "$*")
echo "::set-output name=output::$response"
