# 快速部署指南 · Quick Deployment Guide

## ⚡ 一键部署

在 `book/site/` 目录下执行：

```bash
cd /Users/zhangxin/pci/book/site
./deploy.sh
```

脚本会自动完成：
1. ✅ 初始化 Git 仓库（如果未初始化）
2. ✅ 添加远程仓库
3. ✅ 提交所有更改
4. ✅ 推送到 GitHub
5. ✅ 触发自动部署

## 📋 首次部署步骤

### Step 1: 进入项目目录
```bash
cd /Users/zhangxin/pci/book/site
```

### Step 2: 确保依赖已安装
```bash
npm install
```

### Step 3: 本地测试（可选）
```bash
npm run build
npm run serve
# 访问 http://localhost:3000 测试
```

### Step 4: 执行部署
```bash
./deploy.sh
```

按提示输入提交信息，或直接回车使用默认信息。

### Step 5: 在 GitHub 启用 Pages

1. 访问：https://github.com/zhangxin840/behavioral-simulation-theory/settings/pages
2. **Source** 选择：`GitHub Actions`
3. 保存

### Step 6: 等待部署完成

- 查看进度：https://github.com/zhangxin840/behavioral-simulation-theory/actions
- 首次部署约需 2-3 分钟

### Step 7: 访问站点

部署成功后访问：
**https://zhangxin840.github.io/behavioral-simulation-theory/**

---

## 🔄 后续更新流程

### 方式一：使用脚本（推荐）
```bash
cd /Users/zhangxin/pci/book/site
./deploy.sh
```

### 方式二：手动执行
```bash
cd /Users/zhangxin/pci/book/site
git add .
git commit -m "Update content"
git push
```

GitHub Actions 会自动重新部署。

---

## ⚠️ 重要提示

### 内容更新工作流

由于 `docusaurus.config.js` 中 docs.path 指向 `../manuscript`：

1. **编辑内容**：在 `/Users/zhangxin/pci/book/manuscript/` 中编辑
2. **部署站点**：在 `/Users/zhangxin/pci/book/site/` 中运行 `./deploy.sh`

这样可以保持内容源在 PCI 仓库，站点独立部署。

### 如果需要将 manuscript 也放入站点仓库

如果希望完全独立，需要：

1. 将 `../manuscript` 复制到 `book/site/docs`
2. 修改 `docusaurus.config.js`：
   ```js
   docs: {
     path: path.resolve(__dirname, 'docs'),  // 修改这里
     // ...
   }
   ```

---

## 🛠️ 故障排除

### 问题 1: 远程仓库已存在
```bash
git remote remove origin
git remote add origin https://github.com/zhangxin840/behavioral-simulation-theory.git
```

### 问题 2: 部署失败
检查 Actions 日志，常见原因：
- Node.js 版本不兼容（需要 >=16.14）
- package-lock.json 缺失
- 构建错误

### 问题 3: 页面显示 404
- 确认 GitHub Pages 已启用并选择 "GitHub Actions"
- 检查部署是否成功完成
- 等待几分钟让更改生效

---

## 📞 获取帮助

- GitHub Issues: https://github.com/zhangxin840/behavioral-simulation-theory/issues
- Docusaurus 文档: https://docusaurus.io/docs
