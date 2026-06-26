#!/usr/bin/env bash

echo "========================================="
echo " AI DEV TOOLKIT HELP"
echo "========================================="

echo
echo "USAGE:"
echo "  ./scripts/ai-dev <command>"
echo

echo "COMMANDS:"
echo
echo "  setup     → 初期環境チェック"
echo "  install   → AIツール一括インストール"
echo "  doctor    → 環境診断（v4: 自動修復対応）"
echo "  update    → 全ツール更新"
echo "  new       → 新規プロジェクト生成"
echo "  help      → このヘルプ表示"
echo

echo "EXAMPLES:"
echo
echo "  ./scripts/ai-dev setup"
echo "  ./scripts/ai-dev doctor"
echo "  ./scripts/ai-dev doctor --fix"
echo "  ./scripts/ai-dev new stock-ai"
echo

echo "STRUCTURE:"
echo
echo "  scripts/"
echo "    ├── ai-dev        (CLI入口)"
echo "    ├── cmd/"
echo "    │    ├── setup.sh"
echo "    │    ├── doctor.sh"
echo "    │    ├── update.sh"
echo "    │    ├── new.sh"
echo "    │    └── help.sh"
echo

echo "[TIP] Run doctor first if something is broken."
