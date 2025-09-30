# 部署指南 · Deployment Guide

## 将站点部署到 GitHub Pages

### 1. 初始化独立 Git 仓库

在 `book/site/` 目录下执行：

```bash
cd book/site
git init
git add .
git commit -m "Initial commit: Behavioral Simulation Theory manuscript site"
```

### 2. 关联远程仓库

```bash
git remote add origin https://github.com/zhangxin840/behavioral-simulation-theory.git
git branch -M main
git push -u origin main
```

### 3. 在 GitHub 上启用 Pages

1. 访问仓库设置页面：https://github.com/zhangxin840/behavioral-simulation-theory/settings/pages
2. 在 "Build and deployment" 部分：
   - **Source**: 选择 "GitHub Actions"
3. 保存设置

### 4. 触发部署

推送代码后，GitHub Actions 会自动：
- 安装依赖
- 构建站点
- 部署到 GitHub Pages

查看部署状态：
- Actions 页面：https://github.com/zhangxin840/behavioral-simulation-theory/actions

### 5. 访问站点

部署成功后，访问：**https://zhangxin840.github.io/behavioral-simulation-theory/**

---

## 后续更新流程

### 在 PCI 仓库中更新内容

1. 在 `/Users/zhangxin/pci/book/manuscript/` 中编辑内容
2. 内容会自动同步到 site（因为 docusaurus.config.js 中 docs.path 指向 manuscript）

### 部署更新

从 `book/site/` 目录执行：

```bash
cd book/site
git add .
git commit -m "Update manuscript content"
git push
```

GitHub Actions 会自动重新部署。

---

## 本地测试

### 开发模式（热重载）

```bash
npm run start
```

访问：http://localhost:3000

### 构建测试

```bash
npm run build
npm run serve
```

访问：http://localhost:3000

---

## 故障排除

### 1. 部署失败

- 检查 Actions 日志：https://github.com/zhangxin840/behavioral-simulation-theory/actions
- 确认 `package-lock.json` 已提交
- 确认 Node.js 版本兼容（需要 >=16.14）

### 2. 页面 404

- 确认 GitHub Pages 已启用
- 检查 `docusaurus.config.js` 中的 `baseUrl` 设置
- 等待几分钟让 DNS 传播

### 3. 样式/资源加载失败

- 检查浏览器控制台错误
- 确认 `baseUrl: '/behavioral-simulation-theory/'` 配置正确
- 清除浏览器缓存

---

## 配置说明

当前配置（`docusaurus.config.js`）：

```javascript
{
  url: 'https://zhangxin840.github.io',
  baseUrl: '/behavioral-simulation-theory/',
  organizationName: 'zhangxin840',
  projectName: 'behavioral-simulation-theory',
  deploymentBranch: 'gh-pages'  // GitHub Actions 会自动处理
}
```

## 自定义域名（可选）

如需使用自定义域名：

1. 在 `book/site/static/` 下创建 `CNAME` 文件，内容为你的域名
2. 在域名提供商处配置 DNS 记录
3. 在 GitHub 仓库设置中配置自定义域名
