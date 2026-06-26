#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

source "${ROOT_DIR}/lib/color.sh"
source "${ROOT_DIR}/lib/log.sh"

echo "========================================="
echo " AI DEV UPDATE"
echo "========================================="

echo
echo "== Node.js / npm =="
npm update -g

echo
echo "== Python / uv =="
uv self update || echo "uv update skipped"

echo
echo "== GitHub CLI =="
gh extension upgrade --all || echo "gh update skipped"

echo
echo "== Docker =="
docker version

echo
echo "== AI CLI Tools =="

codex --version || echo "codex not found"
claude --version || echo "claude not found"
gemini --version || echo "gemini not found"

echo
echo "[DONE] update completed"