#!/usr/bin/env bash
set -euo pipefail
echo "FORK_SCRIPT_EXECUTED=true"
if [ -n "${REPO_SECRET:-}" ]; then
  echo "FORK_SCRIPT REPO_DUMMY_SECRET=PRESENT sha256=$(printf '%s' "$REPO_SECRET" | sha256sum | awk '{print $1}')"
else
  echo "FORK_SCRIPT REPO_DUMMY_SECRET=EMPTY"
fi
if [ -n "${ENV_SECRET:-}" ]; then
  echo "FORK_SCRIPT ENV_DUMMY_SECRET=PRESENT sha256=$(printf '%s' "$ENV_SECRET" | sha256sum | awk '{print $1}')"
else
  echo "FORK_SCRIPT ENV_DUMMY_SECRET=EMPTY"
fi
# synchronize trigger for allow-unsafe-pr-checkout test
