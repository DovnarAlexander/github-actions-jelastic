#!/bin/bash

set -e

response=$(echo n | /cli/jelastic/users/authentication/signin --login "$JELASTIC_USERNAME" --password "$JELASTIC_PASSWORD" --platformUrl "$JELASTIC_URL" > /dev/null
/cli/jelastic/"$1" "${@:2}" | sed '/./{H;$!d} ; x ; s/^[^{]*//g' | sed '/./{H;$!d} ; x ; s/[^}]*$//g' | jq
)
echo "$response"
