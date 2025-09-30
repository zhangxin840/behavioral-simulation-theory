# 部署故障排除指南 · Troubleshooting Guide

## 🔍 诊断步骤

### 1. 检查 GitHub Pages 设置 ⚠️ 最常见问题

访问：https://github.com/zhangxin840/behavioral-simulation-theory/settings/pages

**必须确认**：
- ✅ **Source** 选择的是 **`GitHub Actions`**（不是 "Deploy from a branch"）
- ✅ 如果显示 "Branch" 选项，说明设置错误

**如何修复**：
1. 在 "Source" 下拉菜单中选择 **`GitHub Actions`**
2. 保存后会自动触发部署

---

### 2. 检查 Actions 运行状态

访问：https://github.com/zhangxin840/behavioral-simulation-theory/actions

**查看内容**：
- ❌ 红色 X = 失败
- 🟡 黄色圆圈 = 运行中
- ✅ 绿色 ✓ = 成功

**如果失败**：
1. 点击失败的 workflow
2. 查看错误日志
3. 根据错误信息修复

---

### 3. 检查仓库权限

访问：https://github.com/zhangxin840/behavioral-simulation-theory/settings/actions

确认：
- ✅ **Workflow permissions** 设置为：
  - "Read and write permissions" 或
  - 至少勾选 "Allow GitHub Actions to create and approve pull requests"

---

### 4. 手动触发部署

如果自动部署没有触发：

1. 访问：https://github.com/zhangxin840/behavioral-simulation-theory/actions
2. 点击左侧 "Deploy to GitHub Pages"
3. 点击右上角 "Run workflow"
4. 选择 `main` 分支
5. 点击绿色 "Run workflow" 按钮

---

## 🛠️ 常见错误及解决方案

### 错误 1: "Source must be set to GitHub Actions"

**现象**：访问站点显示 404

**原因**：GitHub Pages 设置错误

**解决**：
1. 访问：https://github.com/zhangxin840/behavioral-simulation-theory/settings/pages
2. 在 "Build and deployment" → "Source" 选择 **`GitHub Actions`**
3. 保存

---

### 错误 2: "Workflow not found"

**现象**：Actions 页面没有 workflow

**原因**：`.github/workflows/deploy.yml` 文件位置错误

**检查**：
```bash
cd /Users/zhangxin/pci/book/site
ls -la .github/workflows/deploy.yml
```

**解决**：确保文件存在且已推送到 GitHub

---

### 错误 3: "npm ci failed"

**现象**：Actions 在安装依赖时失败

**原因**：package-lock.json 问题

**解决**：
```bash
cd /Users/zhangxin/pci/book/site
rm -rf node_modules package-lock.json
npm install
git add package-lock.json
git commit -m "Fix package-lock.json"
git push
```

---

### 错误 4: "Build failed"

**现象**：构建步骤失败

**诊断**：本地测试构建
```bash
cd /Users/zhangxin/pci/book/site
npm run build
```

**解决**：根据错误信息修复代码

---

### 错误 5: "Permission denied"

**现象**：deploy 步骤失败，提示权限不足

**解决**：
1. 访问：https://github.com/zhangxin840/behavioral-simulation-theory/settings/actions
2. 滚动到 "Workflow permissions"
3. 选择 "Read and write permissions"
4. 保存
5. 重新运行 workflow

---

## 🔧 立即修复脚本

在 `book/site` 目录运行：

```bash
cd /Users/zhangxin/pci/book/site

# 1. 确保本地构建成功
npm run build

# 2. 清理并重新安装依赖
rm -rf node_modules package-lock.json
npm install

# 3. 提交并推送
git add .
git commit -m "Fix deployment issues"
git push
```

---

## 📋 完整检查清单

按顺序检查：

1. [ ] GitHub Pages Source 设置为 "GitHub Actions"
2. [ ] Workflow 文件存在：`.github/workflows/deploy.yml`
3. [ ] 本地构建成功：`npm run build`
4. [ ] package-lock.json 已提交
5. [ ] Actions 权限正确设置
6. [ ] 最新代码已推送到 main 分支
7. [ ] Workflow 运行成功（绿色 ✓）
8. [ ] 等待 2-3 分钟让部署完成

---

## 🆘 仍然失败？

### 查看详细日志

1. 访问：https://github.com/zhangxin840/behavioral-simulation-theory/actions
2. 点击最新的 workflow run
3. 查看每个步骤的详细输出
4. 将错误信息复制出来

### 验证配置

检查 `docusaurus.config.js`：
```javascript
{
  url: 'https://zhangxin840.github.io',
  baseUrl: '/behavioral-simulation-theory/',
  organizationName: 'zhangxin840',
  projectName: 'behavioral-simulation-theory',
}
```

### 验证仓库设置

确认：
- ✅ 仓库名称：`behavioral-simulation-theory`
- ✅ 仓库可见性：Public
- ✅ GitHub Pages 已启用

---

## 📞 获取帮助

如果所有步骤都正确但仍然失败：

1. **检查 GitHub Status**：https://www.githubstatus.com/
2. **查看 Actions 文档**：https://docs.github.com/en/pages/getting-started-with-github-pages/using-custom-workflows-with-github-pages
3. **Docusaurus 部署文档**：https://docusaurus.io/docs/deployment#deploying-to-github-pages

---

## ✅ 成功标志

部署成功后你会看到：

1. ✅ Actions 页面显示绿色 ✓
2. ✅ Settings → Pages 显示 "Your site is live at ..."
3. ✅ https://zhangxin840.github.io/behavioral-simulation-theory/ 可访问
4. ✅ 页面内容正确显示
