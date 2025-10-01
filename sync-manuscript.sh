#!/bin/bash

# 内容同步脚本 · Manuscript Sync Script
# 将 /book/manuscript/ 的内容同步到 /book/site/manuscript/
# 保留 site 特有的文件（book-structure.md, writing-style-guide.md）

set -e  # 遇到错误立即退出

# 颜色定义
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  内容同步脚本 · Manuscript Sync${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# 获取脚本所在目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BOOK_DIR="$(dirname "$SCRIPT_DIR")"

SOURCE_DIR="$BOOK_DIR/manuscript"
TARGET_DIR="$SCRIPT_DIR/manuscript"

echo -e "${YELLOW}📁 源目录:${NC} $SOURCE_DIR"
echo -e "${YELLOW}📁 目标目录:${NC} $TARGET_DIR"
echo ""

# 检查源目录是否存在
if [ ! -d "$SOURCE_DIR" ]; then
    echo -e "${YELLOW}❌ 错误: 源目录不存在!${NC}"
    echo "   $SOURCE_DIR"
    exit 1
fi

# 执行同步
echo -e "${BLUE}🔄 开始同步...${NC}"
echo ""

rsync -av --delete \
    --exclude='book-structure.md' \
    --exclude='writing-style-guide.md' \
    "$SOURCE_DIR/" "$TARGET_DIR/" \
    | grep -E "^(sending|sent|total size|deleting|.*\.md$)" || true

echo ""
echo -e "${GREEN}✅ 同步完成!${NC}"
echo ""

# 验证构建
echo -e "${BLUE}🔨 验证构建...${NC}"
echo ""

cd "$SCRIPT_DIR"

if npm run build > /tmp/build.log 2>&1; then
    echo -e "${GREEN}✅ 构建成功!${NC}"
    echo ""
    
    # 显示统计
    echo -e "${BLUE}📊 统计信息:${NC}"
    FILE_COUNT=$(find "$TARGET_DIR" -name "*.md" | wc -l | tr -d ' ')
    echo "   - Markdown 文件: $FILE_COUNT 个"
    BUILD_SIZE=$(du -sh build 2>/dev/null | cut -f1)
    echo "   - 构建大小: $BUILD_SIZE"
    echo ""
    
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}  同步和构建均成功完成! 🎉${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo ""
    echo -e "${YELLOW}💡 下一步:${NC}"
    echo "   1. 本地预览: ${BLUE}npm run serve${NC}"
    echo "   2. 部署上线: ${BLUE}./deploy.sh${NC}"
    echo ""
else
    echo -e "${YELLOW}❌ 构建失败!${NC}"
    echo ""
    echo "查看详细错误信息:"
    echo "   cat /tmp/build.log"
    echo ""
    exit 1
fi

