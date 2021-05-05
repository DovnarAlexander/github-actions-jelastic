#!/bin/bash

set -e

$HOME/entrypoint.sh $@
echo "::set-output name=output::$(cat $OUTPUT)"
