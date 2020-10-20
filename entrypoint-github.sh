#!/bin/bash

set -e

export HOME=/cli  # To overwrite GitHub run command

cd $HOME
IFS=" " read -r -a args <<< "$@"
response=$(/cli/entrypoint.sh "${args[@]}" | jq --compact-output)
echo "::set-output name=output::$response"
