#!/bin/bash

set -e

export HOME=/cli  # To overwrite GitHub run command

cd $HOME
response=$(/cli/entrypoint.sh "$*" | jq --compact-output)
echo "::set-output name=output::$response"
