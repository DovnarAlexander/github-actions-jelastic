#!/bin/bash

set -e

echo n | "$HOME/jelastic/users/authentication/signin" --login "$JELASTIC_USERNAME" --password "$JELASTIC_PASSWORD" --platformUrl "$JELASTIC_URL" > /dev/null
"$HOME"/jelastic/"$*"
