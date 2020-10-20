#!/bin/bash

set -e

export HOME=/cli  # To overwrite GitHub run command

cd $HOME
response=$(/cli/entrypoint.sh "$1" "${@:2}" | jq --compact-output)
echo "::set-output name=output::$response"
