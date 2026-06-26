#!/usr/bin/env bash

set +e

FIX_MODE=false

if [ "$1" == "--fix" ]; then
    FIX_MODE=true
fi

echo "========================================="
echo " AI DEV DOCTOR v4 (SELF HEALING)"
echo " FIX MODE: $FIX_MODE"
echo "========================================="

OK=0
NG=0

run_check() {
    local name=$1
    local check_cmd=$2
    local fix_cmd=$3

    echo -n "[CHECK] $name ... "

    if eval "$check_cmd" > /dev/null 2>&1; then
        echo "OK"
        ((OK++))
    else
        echo "NG"
        ((NG++))

        echo "   → FIX: $fix_cmd"

        if [ "$FIX_MODE" = true ]; then
            echo "   → APPLYING FIX..."
            eval "$fix_cmd" || echo "   → FIX FAILED"
        fi
    fi
}

echo
echo "== Core Tools =="

run_check "Git" "git --version" "sudo apt install -y git"
run_check "Python" "python3 --version" "sudo apt install -y python3"
run_check "Node.js" "node -v" "curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - && sudo apt install -y nodejs"
run_check "npm" "npm -v" "sudo apt install -y npm"
run_check "Docker" "docker --version" "sudo apt install -y docker.io"
run_check "uv" "uv --version" "curl -LsSf https://astral.sh/uv/install.sh | sh"

echo
echo "== AI CLI Tools =="

run_check "Codex CLI" "codex --version" "npm install -g @openai/codex"
run_check "Claude Code" "claude --version" "npm install -g @anthropic-ai/claude-code"
run_check "Gemini CLI" "gemini --version" "npm install -g @google/gemini-cli"
run_check "GitHub CLI" "gh --version" "sudo apt install -y gh"

echo
echo "== Git Config =="

run_check "git user.name" "git config user.name" "git config --global user.name 'Your Name'"
run_check "git user.email" "git config user.email" "git config --global user.email 'you@example.com'"

echo
echo "========================================="
echo "SUMMARY"
echo "========================================="
echo "OK: $OK"
echo "NG: $NG"

if [ "$NG" -eq 0 ]; then
    echo "[ALL GOOD] System is healthy"
else
    echo "[WARNING] Issues detected"
    if [ "$FIX_MODE" = true ]; then
        echo "[AUTO FIX MODE ENABLED]"
    fi
fi
