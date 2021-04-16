#!/bin/bash

set -e

login=$1
json=$2
command=$3
home="/cli/jelastic"

if [ "$login" == "true" ]
then
  echo n | $home/users/authentication/signin --login "$JELASTIC_USERNAME" --password "$JELASTIC_PASSWORD" --platformUrl "$JELASTIC_URL" > /dev/null
fi
response=$("$home/$command" "${@:3}")

if [ "$json" == "true" ]
then
  response=$(echo "$response" | sed -n '1!p' | jq --compact-output || echo "$response")
fi

echo "$response"
