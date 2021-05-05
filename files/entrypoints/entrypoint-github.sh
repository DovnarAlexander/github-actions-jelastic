#!/bin/bash

set -e
export HOME=/cli

"$HOME"/entrypoint.sh "$@"
echo "::set-output name=output::'$(cat "$OUTPUT")'"
