#!/bin/bash

# 重新部署脚本 - Redeploy to GitHub Pages
# 使用方法: ./redeploy.sh

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}🚀 开始重新部署到 GitHub Pages...${NC}"
echo ""

# 检查是否在正确的目录
if [ ! -f "docusaurus.config.js" ]; then
    echo -e "${RED}❌ 错误: 请在 book/site/ 目录下运行此脚本${NC}"
    exit 1
fi

echo -e "${YELLOW}步骤 1: 检查本地构建${NC}"
echo "────────────────────────────────────────"
echo "测试本地构建是否成功..."
if npm run build > /tmp/build.log 2>&1; then
    echo -e "${GREEN}✓ 本地构建成功${NC}"
    BUILD_SIZE=$(du -sh build 2>/dev/null | cut -f1 || echo "未知")
    echo "  构建大小: $BUILD_SIZE"
else
    echo -e "${RED}✗ 本地构建失败${NC}"
    echo "  查看错误日志: tail -50 /tmp/build.log"
    exit 1
fi
echo ""

echo -e "${YELLOW}步骤 2: 检查 Git 状态${NC}"
echo "────────────────────────────────────────"
if git diff-index --quiet HEAD --; then
    echo -e "${GREEN}✓ 没有未提交的更改${NC}"
else
    echo -e "${YELLOW}⚠ 发现未提交的更改${NC}"
    git status --short
    echo ""
    read -p "是否提交这些更改？(y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        read -p "输入提交信息 (默认: Update content): " COMMIT_MSG
        COMMIT_MSG=${COMMIT_MSG:-"Update content"}
        git add .
        git commit -m "$COMMIT_MSG"
        echo -e "${GREEN}✓ 更改已提交${NC}"
    else
        echo -e "${YELLOW}⚠ 跳过提交，将部署当前已提交的版本${NC}"
    fi
fi
echo ""

echo -e "${YELLOW}步骤 3: 推送到 GitHub${NC}"
echo "────────────────────────────────────────"
echo "推送到 GitHub..."
if git push; then
    echo -e "${GREEN}✓ 推送成功${NC}"
    CURRENT_COMMIT=$(git rev-parse --short HEAD)
    echo "  当前提交: $CURRENT_COMMIT"
else
    echo -e "${RED}✗ 推送失败${NC}"
    exit 1
fi
echo ""

echo -e "${YELLOW}步骤 4: 检查 GitHub Pages 配置${NC}"
echo "────────────────────────────────────────"
echo ""
echo -e "${BLUE}⚠️  重要：请确认 GitHub Pages Source 设置正确${NC}"
echo ""
echo "1. 访问："
echo -e "   ${GREEN}https://github.com/zhangxin840/behavioral-simulation-theory/settings/pages${NC}"
echo ""
echo "2. 确认 'Source' 设置为："
echo -e "   ${GREEN}GitHub Actions${NC} (不是 'Deploy from a branch')"
echo ""
echo "3. 如果不正确，请："
echo "   - 点击 Source 下拉菜单"
echo "   - 选择 'GitHub Actions'"
echo "   - 自动保存"
echo ""
read -p "已确认 Source 设置为 'GitHub Actions' 吗？(y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo ""
    echo -e "${YELLOW}请先完成 GitHub Pages 配置，然后重新运行此脚本${NC}"
    exit 0
fi
echo ""

echo -e "${YELLOW}步骤 5: 监控部署进度${NC}"
echo "────────────────────────────────────────"
echo ""
echo "GitHub Actions 正在部署..."
echo ""
echo "查看实时进度："
echo -e "${GREEN}https://github.com/zhangxin840/behavioral-simulation-theory/actions${NC}"
echo ""
echo "等待部署完成（通常需要 2-3 分钟）..."
echo ""

# 等待并检查
for i in {1..6}; do
    echo -n "."
    sleep 10
done
echo ""
echo ""

echo -e "${YELLOW}步骤 6: 验证部署${NC}"
echo "────────────────────────────────────────"
echo "检查网站状态..."
echo ""

# 检查网站内容
CONTENT=$(curl -s https://zhangxin840.github.io/behavioral-simulation-theory/ | head -200)

if echo "$CONTENT" | grep -q "docusaurus"; then
    echo -e "${GREEN}✓ 部署成功！网站正在使用 Docusaurus${NC}"
    echo ""
    echo -e "${BLUE}🎉 部署完成！${NC}"
    echo ""
    echo "访问你的网站："
    echo -e "${GREEN}https://zhangxin840.github.io/behavioral-simulation-theory/${NC}"
    echo ""
elif echo "$CONTENT" | grep -q "Jekyll"; then
    echo -e "${RED}✗ 网站仍在使用 Jekyll（显示 README）${NC}"
    echo ""
    echo -e "${YELLOW}可能的原因：${NC}"
    echo "1. GitHub Pages Source 未设置为 'GitHub Actions'"
    echo "2. Actions workflow 部署失败"
    echo "3. CDN 缓存未更新（需要等待几分钟）"
    echo ""
    echo -e "${BLUE}解决方案：${NC}"
    echo "1. 确认 Pages 设置："
    echo -e "   ${GREEN}https://github.com/zhangxin840/behavioral-simulation-theory/settings/pages${NC}"
    echo ""
    echo "2. 检查 Actions 状态："
    echo -e "   ${GREEN}https://github.com/zhangxin840/behavioral-simulation-theory/actions${NC}"
    echo ""
    echo "3. 等待 5-10 分钟后重试（清除浏览器缓存）"
    echo ""
else
    echo -e "${YELLOW}⚠ 无法确定网站状态${NC}"
    echo "请手动访问检查："
    echo -e "${GREEN}https://zhangxin840.github.io/behavioral-simulation-theory/${NC}"
    echo ""
fi

echo "────────────────────────────────────────"
echo ""
echo "📚 相关链接："
echo ""
echo "• 网站地址:"
echo -e "  ${GREEN}https://zhangxin840.github.io/behavioral-simulation-theory/${NC}"
echo ""
echo "• Pages 设置:"
echo -e "  ${GREEN}https://github.com/zhangxin840/behavioral-simulation-theory/settings/pages${NC}"
echo ""
echo "• Actions 状态:"
echo -e "  ${GREEN}https://github.com/zhangxin840/behavioral-simulation-theory/actions${NC}"
echo ""
echo "• 仓库主页:"
echo -e "  ${GREEN}https://github.com/zhangxin840/behavioral-simulation-theory${NC}"
echo ""
