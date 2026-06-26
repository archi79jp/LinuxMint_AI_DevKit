#!/usr/bin/env bash

set -e

PROJECT_NAME=$1

if [ -z "$PROJECT_NAME" ]; then
    echo "Usage: ai-dev new <project-name>"
    exit 1
fi

echo "========================================="
echo " AI DEV NEW PROJECT"
echo "========================================="

mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

echo "[1/6] Init git"
git init

echo "[2/6] Init uv"
uv init

echo "[3/6] Create structure"
mkdir -p src config data docs tests logs

echo "[4/6] Create basic files"
touch README.md
touch .gitignore
touch .env.example

echo "[5/6] Create src structure"
mkdir -p src/{agents,analyzers,collectors,models,utils}

echo "[6/6] First commit"
git add .
git commit -m "init: project structure"

echo "[DONE] project created: $PROJECT_NAME"