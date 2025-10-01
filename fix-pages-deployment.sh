#!/bin/bash

# 修复 GitHub Pages 部署问题
# Fix GitHub Pages Deployment Issue

set -e

echo "🔧 修复 GitHub Pages 部署..."
echo ""

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;36m'
NC='\033[0m'

echo -e "${BLUE}📋 问题诊断${NC}"
echo "─────────────────────────────────────"
echo ""

# 检查网站当前状态
echo "检查网站当前显示内容..."
CONTENT=$(curl -s https://zhangxin840.github.io/behavioral-simulation-theory/ | grep -o "Jekyll\|Docusaurus" | head -1)

if [ "$CONTENT" = "Jekyll" ]; then
    echo -e "${RED}✗ 问题确认：网站正在使用 Jekyll 渲染 README.md${NC}"
    echo -e "${YELLOW}  这意味着 GitHub Pages Source 设置错误${NC}"
    echo ""
elif [ "$CONTENT" = "Docusaurus" ]; then
    echo -e "${GREEN}✓ 网站正在使用 Docusaurus（正确）${NC}"
    echo ""
    exit 0
else
    echo -e "${YELLOW}⚠ 无法确定网站状态${NC}"
    echo ""
fi

echo -e "${BLUE}🎯 修复步骤${NC}"
echo "─────────────────────────────────────"
echo ""

echo "请按照以下步骤操作："
echo ""

echo -e "${YELLOW}步骤 1：打开 GitHub Pages 设置${NC}"
echo "   访问："
echo -e "   ${GREEN}https://github.com/zhangxin840/behavioral-simulation-theory/settings/pages${NC}"
echo ""

echo -e "${YELLOW}步骤 2：检查当前 Source 设置${NC}"
echo "   如果看到："
echo "   - 'Deploy from a branch' + 'main' → 这就是问题所在！"
echo "   - 'GitHub Actions' → 配置正确"
echo ""

echo -e "${YELLOW}步骤 3：修改 Source 设置${NC}"
echo "   1. 点击 'Source' 下拉菜单"
echo "   2. 选择 'GitHub Actions'"
echo "   3. 会自动保存"
echo ""

echo -e "${YELLOW}步骤 4：等待重新部署${NC}"
echo "   1. 访问："
echo -e "      ${GREEN}https://github.com/zhangxin840/behavioral-simulation-theory/actions${NC}"
echo "   2. 等待新的 workflow run 完成（约 2-3 分钟）"
echo "   3. 看到绿色 ✓ 后继续"
echo ""

echo -e "${YELLOW}步骤 5：验证修复${NC}"
echo "   1. 清除浏览器缓存（重要！）"
echo "   2. 访问："
echo -e "      ${GREEN}https://zhangxin840.github.io/behavioral-simulation-theory/${NC}"
echo "   3. 应该看到 Docusaurus 网站，而不是 README"
echo ""

echo "─────────────────────────────────────"
echo ""

read -p "是否已完成 GitHub Pages 设置修改？(y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo ""
    echo "⏱️  等待 30 秒让设置生效..."
    sleep 30
    
    echo ""
    echo "🔍 重新检查网站..."
    NEW_CONTENT=$(curl -s https://zhangxin840.github.io/behavioral-simulation-theory/ | head -100)
    
    if echo "$NEW_CONTENT" | grep -q "Docusaurus"; then
        echo -e "${GREEN}✓ 修复成功！网站现在使用 Docusaurus${NC}"
        echo ""
        echo "🎉 部署完成！访问："
        echo -e "   ${GREEN}https://zhangxin840.github.io/behavioral-simulation-theory/${NC}"
    elif echo "$NEW_CONTENT" | grep -q "Jekyll"; then
        echo -e "${YELLOW}⚠ 网站仍在使用 Jekyll${NC}"
        echo "   可能需要："
        echo "   1. 等待更长时间（清除 CDN 缓存需要几分钟）"
        echo "   2. 确认 GitHub Actions workflow 已成功运行"
        echo "   3. 清除浏览器缓存后重试"
    else
        echo -e "${YELLOW}⚠ 网站状态未知，请手动检查${NC}"
    fi
else
    echo ""
    echo "请先完成 GitHub Pages 设置，然后重新运行此脚本。"
fi

echo ""
echo "📚 详细文档："
echo "   - QUICK_CONFIG.md - 快速配置指南"
echo "   - GITHUB_SETUP_GUIDE.md - 完整配置说明"
echo "   - TROUBLESHOOTING.md - 故障排除"
echo ""
