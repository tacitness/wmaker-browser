#!/usr/bin/env bash
set -euo pipefail

required=(
  README.md
  AGENTS.md
  SDD.md
  ROADMAP.md
  RELEASING.md
  docs/ticket-standards.md
  docs/phase-3-fallback.md
)

for path in "${required[@]}"; do
  if [[ ! -s "$path" ]]; then
    echo "missing or empty required file: $path" >&2
    exit 1
  fi
done

if rg -n --hidden \
  -g '!.git' \
  -g '!scripts/validate-docs.sh' \
  -e 'gho_[A-Za-z0-9_]+' \
  -e 'github_pat_' \
  -e 'AKIA[0-9A-Z]{16}' \
  -e 'BEGIN (RSA |OPENSSH |EC |DSA )?PRIVATE KEY' \
  .; then
  echo "possible secret material found" >&2
  exit 1
fi

if ! grep -q '\[M#\]\[E#\]\[category\]' docs/ticket-standards.md; then
  echo "ticket title convention is not documented" >&2
  exit 1
fi

echo "docs validation passed"
