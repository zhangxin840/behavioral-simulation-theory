#!/bin/bash

# 自动发布脚本 · Auto Publish Script
# 完整流程: 同步内容 → 构建验证 → 提交推送 → GitHub Pages 部署
# 使用方法: ./publish.sh

set -e  # 遇到错误立即退出

# 颜色定义
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# 获取脚本所在目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

echo ""
echo -e "${BLUE}╔════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   📚 行为模拟论 · 自动发布脚本                    ║${NC}"
echo -e "${BLUE}║   Behavioral Simulation Theory · Auto Publish     ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════╝${NC}"
echo ""

# ============================================
# 步骤 1: 同步内容
# ============================================
echo -e "${BOLD}${BLUE}[步骤 1/5] 📄 同步 manuscript 内容${NC}"
echo -e "${YELLOW}从 /book/manuscript/ 同步最新内容到 /book/site/manuscript/${NC}"
echo ""

BOOK_DIR="$(dirname "$SCRIPT_DIR")"
SOURCE_DIR="$BOOK_DIR/manuscript"
TARGET_DIR="$SCRIPT_DIR/manuscript"

if [ ! -d "$SOURCE_DIR" ]; then
    echo -e "${RED}❌ 错误: 源目录不存在!${NC}"
    echo "   $SOURCE_DIR"
    exit 1
fi

echo "源目录: $SOURCE_DIR"
echo "目标目录: $TARGET_DIR"
echo ""

# 执行同步
rsync -av --delete \
    --exclude='book-structure.md' \
    --exclude='writing-style-guide.md' \
    "$SOURCE_DIR/" "$TARGET_DIR/" \
    | grep -E "^(sending|sent|total size|.*\.md$)" || true

echo ""
echo -e "${GREEN}✅ 内容同步完成${NC}"
echo ""

# ============================================
# 步骤 2: 构建验证
# ============================================
echo -e "${BOLD}${BLUE}[步骤 2/5] 🔨 构建并验证${NC}"
echo -e "${YELLOW}确保所有内容能够正确编译${NC}"
echo ""

if npm run build > /tmp/build.log 2>&1; then
    echo -e "${GREEN}✅ 构建成功!${NC}"
    
    # 显示统计
    FILE_COUNT=$(find "$TARGET_DIR" -name "*.md" | wc -l | tr -d ' ')
    BUILD_SIZE=$(du -sh build 2>/dev/null | cut -f1)
    echo "   - Markdown 文件: $FILE_COUNT 个"
    echo "   - 构建大小: $BUILD_SIZE"
    echo ""
else
    echo -e "${RED}❌ 构建失败!${NC}"
    echo ""
    echo "详细错误信息:"
    cat /tmp/build.log
    echo ""
    exit 1
fi

# ============================================
# 步骤 3: Git 状态检查
# ============================================
echo -e "${BOLD}${BLUE}[步骤 3/5] 📋 检查 Git 状态${NC}"
echo ""

# 检查是否在正确的目录
if [ ! -f "docusaurus.config.js" ]; then
    echo -e "${RED}❌ 错误: 请在 book/site/ 目录下运行此脚本${NC}"
    exit 1
fi

# 检查是否已安装依赖
if [ ! -d "node_modules" ]; then
    echo "📦 安装依赖..."
    npm install
    echo ""
fi

# 检查是否已初始化 git
if [ ! -d ".git" ]; then
    echo "🔧 初始化 Git 仓库..."
    git init
    git branch -M main
    echo ""
fi

# 检查是否已添加远程仓库
if ! git remote | grep -q "origin"; then
    echo "🔗 添加远程仓库..."
    git remote add origin https://github.com/zhangxin840/behavioral-simulation-theory.git
    echo ""
fi

# 显示当前状态
echo "当前更改:"
git status --short | head -10
CHANGE_COUNT=$(git status --short | wc -l | tr -d ' ')
echo ""
echo "共 ${CHANGE_COUNT} 个文件有更改"
echo ""

if [ "$CHANGE_COUNT" -eq "0" ]; then
    echo -e "${YELLOW}⚠️  没有新的更改需要提交${NC}"
    echo ""
    read -p "是否继续推送？(y/N) " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "取消发布"
        exit 0
    fi
fi

# ============================================
# 步骤 4: 提交更改
# ============================================
echo -e "${BOLD}${BLUE}[步骤 4/5] 💾 提交更改${NC}"
echo ""

# 获取当前日期
CURRENT_DATE=$(date +%Y-%m-%d)

# 默认提交信息
DEFAULT_MSG="Sync manuscript and update site - $CURRENT_DATE"

echo "请输入提交信息（留空使用默认）:"
echo "默认: $DEFAULT_MSG"
echo ""
read -p "提交信息: " COMMIT_MSG
COMMIT_MSG=${COMMIT_MSG:-"$DEFAULT_MSG"}

git add .
if git commit -m "$COMMIT_MSG"; then
    echo ""
    echo -e "${GREEN}✅ 提交成功${NC}"
else
    echo ""
    echo -e "${YELLOW}ℹ️  没有新的更改需要提交${NC}"
fi
echo ""

# ============================================
# 步骤 5: 推送到 GitHub
# ============================================
echo -e "${BOLD}${BLUE}[步骤 5/5] 🚀 推送到 GitHub 并触发部署${NC}"
echo ""

echo "即将推送到: https://github.com/zhangxin840/behavioral-simulation-theory"
echo ""
read -p "确认推送？(Y/n) " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Nn]$ ]]; then
    echo "取消推送"
    exit 0
fi

echo ""
echo "正在推送..."
if git push -u origin main; then
    echo ""
    echo -e "${GREEN}✅ 推送成功!${NC}"
else
    echo ""
    echo -e "${RED}❌ 推送失败${NC}"
    echo ""
    echo "可能的原因:"
    echo "1. 网络问题"
    echo "2. 远程仓库有新的更改需要先拉取"
    echo "3. 权限问题"
    echo ""
    echo "建议操作:"
    echo "  git pull origin main --rebase"
    echo "  git push origin main"
    exit 1
fi

# ============================================
# 完成
# ============================================
echo ""
echo -e "${GREEN}╔════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║   🎉 发布成功!                                     ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════════════╝${NC}"
echo ""

echo -e "${BOLD}📊 部署信息:${NC}"
echo ""
echo "提交信息: $COMMIT_MSG"
echo "同步文件: $FILE_COUNT 个 Markdown 文件"
echo "构建大小: $BUILD_SIZE"
echo ""

echo -e "${BOLD}📍 重要链接:${NC}"
echo ""
echo "🔍 GitHub Actions (查看部署状态):"
echo "   https://github.com/zhangxin840/behavioral-simulation-theory/actions"
echo ""
echo "🌐 网站地址 (部署完成后访问):"
echo "   https://zhangxin840.github.io/behavioral-simulation-theory/"
echo ""

echo -e "${YELLOW}⏱️  部署时间:${NC}"
echo "   首次部署: 约 3-5 分钟"
echo "   后续部署: 约 2-3 分钟"
echo ""

echo -e "${BOLD}💡 后续操作:${NC}"
echo "   1. 访问 GitHub Actions 查看部署进度"
echo "   2. 等待绿色 ✅ 出现"
echo "   3. 访问网站验证内容"
echo ""

echo -e "${GREEN}────────────────────────────────────────────────────${NC}"
echo -e "${GREEN}完成时间: $(date +%Y-%m-%d\ %H:%M:%S)${NC}"
echo -e "${GREEN}────────────────────────────────────────────────────${NC}"
echo ""

