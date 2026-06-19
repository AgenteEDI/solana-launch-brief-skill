#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
required=(
  "README.md"
  "LICENSE"
  "install.sh"
  "validate.sh"
  "tests/run_all.sh"
  "skill/SKILL.md"
  "skill/briefing.md"
  "skill/messaging.md"
  "skill/launch-assets.md"
)

for file in "${required[@]}"; do
  [[ -f "${ROOT}/${file}" ]] || { echo "missing: ${file}" >&2; exit 1; }
done

grep -q "^name: solana-launch-brief" "${ROOT}/skill/SKILL.md"
grep -qi "demo flow" "${ROOT}/skill/launch-assets.md"
if rg -n --glob '!validate.sh' --glob '!tests/run_all.sh' "TODO" "${ROOT}" >/dev/null; then
  echo "found TODO markers" >&2
  exit 1
fi

echo "validation ok: solana-launch-brief-skill"
