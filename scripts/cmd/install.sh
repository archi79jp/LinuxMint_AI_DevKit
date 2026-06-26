#!/usr/bin/env bash

###############################################################################
# AI Development Tools Checker
#
# Author : Qi Wang + ChatGPT
# Version: 1.0
###############################################################################

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

source "${ROOT_DIR}/lib/color.sh"
source "${ROOT_DIR}/lib/log.sh"
source "${ROOT_DIR}/lib/check.sh"
source "${ROOT_DIR}/lib/banner.sh"
source "${ROOT_DIR}/lib/common.sh"

print_banner "AI Development Tools Checker"

declare -A RESULT

check_tool() {

    local name="$1"
    local command="$2"
    local version_option="${3:---version}"

    if command_exists "$command"; then

        log_success "$name"

        echo "    Version : $($command "$version_option" 2>/dev/null | head -n 1)"

        RESULT["$name"]="OK"

    else

        log_warn "$name"

        RESULT["$name"]="NG"

    fi

    echo
}

###############################################################################
# Check AI Tools
###############################################################################

check_tool "Git" git
check_tool "GitHub CLI" gh
check_tool "Python" python3
check_tool "uv" uv
check_tool "Node.js" node
check_tool "npm" npm
check_tool "Docker" docker
check_tool "Codex CLI" codex
check_tool "Claude Code" claude
check_tool "Gemini CLI" gemini

###############################################################################
# Summary
###############################################################################

echo
echo "============================================================"
echo "Summary"
echo "============================================================"

for tool in \
    "Git" \
    "GitHub CLI" \
    "Python" \
    "uv" \
    "Node.js" \
    "npm" \
    "Docker" \
    "Codex CLI" \
    "Claude Code" \
    "Gemini CLI"
do
    printf "%-20s %s\n" "$tool" "${RESULT[$tool]}"
done

echo

log_success "AI tools check completed."