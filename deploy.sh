#!/bin/bash

# 部署脚本 - Deploy Behavioral Simulation Theory to GitHub Pages
# 使用方法: ./deploy.sh

set -e  # 遇到错误立即退出

echo "📚 开始部署 Behavioral Simulation Theory 到 GitHub Pages..."
echo ""

# 检查是否在正确的目录
if [ ! -f "docusaurus.config.js" ]; then
    echo "❌ 错误: 请在 book/site/ 目录下运行此脚本"
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

# 添加所有更改
echo "📝 添加文件到 Git..."
git add .
echo ""

# 提交更改
echo "💾 提交更改..."
read -p "请输入提交信息 (默认: Update manuscript): " COMMIT_MSG
COMMIT_MSG=${COMMIT_MSG:-"Update manuscript"}
git commit -m "$COMMIT_MSG" || echo "没有新的更改需要提交"
echo ""

# 推送到 GitHub
echo "🚀 推送到 GitHub..."
git push -u origin main
echo ""

echo "✅ 部署完成！"
echo ""
echo "📊 查看部署状态："
echo "   https://github.com/zhangxin840/behavioral-simulation-theory/actions"
echo ""
echo "🌐 站点地址（部署完成后访问）："
echo "   https://zhangxin840.github.io/behavioral-simulation-theory/"
echo ""
echo "⏱️  首次部署通常需要 2-3 分钟，请稍候..."
