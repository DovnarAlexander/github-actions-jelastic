#!/bin/bash

set -e

echo "Logging in..."
echo n | "$HOME"/jelastic/users/authentication/signin --login "$JELASTIC_USERNAME" --password "$JELASTIC_PASSWORD" --platformUrl "$JELASTIC_URL" > /dev/null

echo "Command execution..."
env
bash "$HOME"/jelastic/"$*" | tee "$OUTPUT"
echo $?
exit_code="$?"
errors_found=$(grep -c "Error" "$OUTPUT" || echo 0)
if [[ "$exit_code" -gt 0 ]] && [[ "$errors_found" -gt 0 ]]
then
  echo "Exception:"
  echo "Exit code: $exit_code"
  echo "Raw output: $(cat "$OUTPUT")"
  exit "$exit_code"
else
  echo "Success"
  jq_output=$(sed -n '1!p' < "$OUTPUT")
  if jq -e . >/dev/null 2>&1 <<<"$jq_output"; then
    echo "$jq_output" | jq --compact-output > "$OUTPUT"
  fi
fi
