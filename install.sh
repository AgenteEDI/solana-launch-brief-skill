#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="solana-launch-brief"
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

TARGET_BASE="${HOME}/.claude/skills"
if [[ "${1:-}" == "--agents" ]]; then
  shift
  TARGET_BASE="${1:-$(pwd)/.agents/skills}"
elif [[ -n "${1:-}" ]]; then
  TARGET_BASE="$1"
fi

mkdir -p "${TARGET_BASE}"
rm -rf "${TARGET_BASE}/${SKILL_NAME}"
cp -R "${SOURCE_DIR}/skill" "${TARGET_BASE}/${SKILL_NAME}"

echo "Installed ${SKILL_NAME} to ${TARGET_BASE}/${SKILL_NAME}"
