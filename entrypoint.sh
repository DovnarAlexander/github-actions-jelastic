#!/bin/sh

set -e

response=$(echo n | "$HOME/jelastic/users/authentication/signin" --login "$JELASTIC_USERNAME" --password "$JELASTIC_PASSWORD" --platformUrl "$JELASTIC_URL" > /dev/null
"$HOME"/jelastic/"$*" | sed '/./{H;$!d} ; x ; s/^[^{]*//g' | sed '/./{H;$!d} ; x ; s/[^}]*$//g' | jq
)
echo "$response"
