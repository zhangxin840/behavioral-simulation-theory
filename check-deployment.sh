#!/bin/bash

# 部署状态检查脚本
# Check Deployment Status

set -e

echo "🔍 检查 Behavioral Simulation Theory 部署状态..."
echo ""

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 检查是否在正确的目录
if [ ! -f "docusaurus.config.js" ]; then
    echo -e "${RED}❌ 错误: 请在 book/site/ 目录下运行此脚本${NC}"
    exit 1
fi

echo "📋 本地环境检查"
echo "─────────────────────────────────────"

# 检查 Node.js 版本
echo -n "Node.js 版本: "
node --version
REQUIRED_VERSION="18.0.0"
CURRENT_VERSION=$(node --version | cut -d'v' -f2)
if [ "$(printf '%s\n' "$REQUIRED_VERSION" "$CURRENT_VERSION" | sort -V | head -n1)" = "$REQUIRED_VERSION" ]; then 
    echo -e "${GREEN}✓ Node.js 版本符合要求${NC}"
else
    echo -e "${RED}✗ Node.js 版本过低，需要 >= 18.14${NC}"
fi
echo ""

# 检查依赖
echo "检查依赖安装..."
if [ -d "node_modules" ]; then
    echo -e "${GREEN}✓ node_modules 存在${NC}"
else
    echo -e "${YELLOW}⚠ node_modules 不存在，正在安装...${NC}"
    npm install
fi
echo ""

# 检查 manuscript 目录
echo "检查内容目录..."
if [ -d "manuscript" ]; then
    echo -e "${GREEN}✓ manuscript 目录存在${NC}"
    FILE_COUNT=$(find manuscript -name "*.md" | wc -l)
    echo "   找到 $FILE_COUNT 个 Markdown 文件"
else
    echo -e "${RED}✗ manuscript 目录不存在${NC}"
    echo "   需要从父目录复制: cp -r ../manuscript ./manuscript"
fi
echo ""

# 测试本地构建
echo "🔨 测试本地构建..."
echo "─────────────────────────────────────"
if npm run build > /tmp/build.log 2>&1; then
    echo -e "${GREEN}✓ 本地构建成功${NC}"
    if [ -d "build" ]; then
        SIZE=$(du -sh build | cut -f1)
        echo "   构建大小: $SIZE"
    fi
else
    echo -e "${RED}✗ 本地构建失败${NC}"
    echo "   查看错误日志: /tmp/build.log"
    echo ""
    echo "最后 20 行错误信息:"
    tail -20 /tmp/build.log
    exit 1
fi
echo ""

# 检查 Git 状态
echo "📦 Git 仓库检查"
echo "─────────────────────────────────────"
if [ -d ".git" ]; then
    echo -e "${GREEN}✓ Git 仓库已初始化${NC}"
    
    # 检查远程仓库
    if git remote | grep -q "origin"; then
        REMOTE_URL=$(git remote get-url origin)
        echo "   远程仓库: $REMOTE_URL"
        
        if [[ "$REMOTE_URL" == *"behavioral-simulation-theory"* ]]; then
            echo -e "${GREEN}✓ 远程仓库配置正确${NC}"
        else
            echo -e "${RED}✗ 远程仓库 URL 不正确${NC}"
        fi
    else
        echo -e "${RED}✗ 未配置远程仓库${NC}"
    fi
    
    # 检查当前分支
    BRANCH=$(git branch --show-current)
    echo "   当前分支: $BRANCH"
    if [ "$BRANCH" = "main" ]; then
        echo -e "${GREEN}✓ 在 main 分支${NC}"
    else
        echo -e "${YELLOW}⚠ 不在 main 分支${NC}"
    fi
    
    # 检查是否有未提交的更改
    if git diff-index --quiet HEAD --; then
        echo -e "${GREEN}✓ 没有未提交的更改${NC}"
    else
        echo -e "${YELLOW}⚠ 有未提交的更改${NC}"
        git status --short
    fi
else
    echo -e "${RED}✗ Git 仓库未初始化${NC}"
fi
echo ""

# 检查 GitHub Actions 配置
echo "⚙️  GitHub Actions 配置检查"
echo "─────────────────────────────────────"
if [ -f ".github/workflows/deploy.yml" ]; then
    echo -e "${GREEN}✓ deploy.yml 存在${NC}"
else
    echo -e "${RED}✗ deploy.yml 不存在${NC}"
fi
echo ""

# 提供下一步建议
echo "📌 下一步操作建议"
echo "─────────────────────────────────────"
echo ""
echo "1. 访问 GitHub Pages 设置页面:"
echo -e "${YELLOW}   https://github.com/zhangxin840/behavioral-simulation-theory/settings/pages${NC}"
echo ""
echo "2. 确认 Source 设置为 'GitHub Actions'"
echo ""
echo "3. 查看 Actions 运行状态:"
echo -e "${YELLOW}   https://github.com/zhangxin840/behavioral-simulation-theory/actions${NC}"
echo ""
echo "4. 如果需要重新部署，运行:"
echo -e "${YELLOW}   git add . && git commit -m 'Update' && git push${NC}"
echo ""
echo "5. 部署成功后访问:"
echo -e "${GREEN}   https://zhangxin840.github.io/behavioral-simulation-theory/${NC}"
echo ""

# 检查站点是否可访问
echo "🌐 检查站点可访问性..."
echo "─────────────────────────────────────"
if command -v curl &> /dev/null; then
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" https://zhangxin840.github.io/behavioral-simulation-theory/ || echo "000")
    if [ "$HTTP_CODE" = "200" ]; then
        echo -e "${GREEN}✓ 站点可访问 (HTTP $HTTP_CODE)${NC}"
    elif [ "$HTTP_CODE" = "404" ]; then
        echo -e "${RED}✗ 站点返回 404 - 可能未部署或 Pages 未启用${NC}"
    else
        echo -e "${YELLOW}⚠ 站点状态未知 (HTTP $HTTP_CODE)${NC}"
    fi
else
    echo -e "${YELLOW}⚠ curl 未安装，跳过在线检查${NC}"
fi
echo ""

echo "✅ 检查完成！"
echo ""
echo "如需详细故障排除，请查看: TROUBLESHOOTING.md"
