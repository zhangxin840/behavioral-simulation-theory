#!/bin/bash

# 快速发布脚本 · Quick Publish (无交互)
# 用于自动化部署，不需要用户输入
# 使用方法: ./quick-publish.sh [commit-message]

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# 获取提交信息（从参数或使用默认）
COMMIT_MSG="${1:-Sync manuscript and update site - $(date +%Y-%m-%d)}"

echo "🚀 快速发布模式"
echo ""

# 1. 同步内容
echo "📄 同步内容..."
BOOK_DIR="$(dirname "$SCRIPT_DIR")"
rsync -av --delete \
    --exclude='book-structure.md' \
    --exclude='writing-style-guide.md' \
    "$BOOK_DIR/manuscript/" "$SCRIPT_DIR/manuscript/" \
    > /dev/null 2>&1

echo "✅ 同步完成"
echo ""

# 2. 构建验证
echo "🔨 构建验证..."
if npm run build > /dev/null 2>&1; then
    echo "✅ 构建成功"
else
    echo "❌ 构建失败"
    exit 1
fi
echo ""

# 3. 提交并推送
echo "💾 提交更改..."
git add .
git commit -m "$COMMIT_MSG" || echo "无新更改"
echo ""

echo "🚀 推送到 GitHub..."
git push origin main
echo ""

echo "✅ 发布完成!"
echo "🌐 https://zhangxin840.github.io/behavioral-simulation-theory/"

