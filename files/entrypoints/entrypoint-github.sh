#!/bin/bash

set -e
export HOME=/cli

/bin/bash -c "set -e && "$HOME"/entrypoint.sh "$@""
echo "::set-output name=output::$(cat "$OUTPUT")"
