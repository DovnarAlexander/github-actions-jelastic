#!/bin/bash

echo n | $HOME/jelastic/users/authentication/signin --login $JELASTIC_USERNAME --password $JELASTIC_PASSWORD --platformUrl $JELASTIC_URL > /dev/null
$HOME/jelastic/$1
