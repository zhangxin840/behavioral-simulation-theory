# 部署检查清单 · Deployment Checklist

## ✅ 部署前检查

- [ ] Node.js 版本 >= 18.14
  ```bash
  node --version
  ```

- [ ] 已安装依赖
  ```bash
  npm install
  ```

- [ ] 本地构建成功
  ```bash
  npm run build
  ```

- [ ] GitHub 仓库已创建
  - 仓库地址: https://github.com/zhangxin840/behavioral-simulation-theory

## 🚀 执行部署

### 选项 A: 一键部署（推荐）

```bash
cd /Users/zhangxin/pci/book/site
./deploy.sh
```

### 选项 B: 手动部署

```bash
cd /Users/zhangxin/pci/book/site

# 1. 初始化 Git（如果未初始化）
git init
git branch -M main

# 2. 添加远程仓库（如果未添加）
git remote add origin https://github.com/zhangxin840/behavioral-simulation-theory.git

# 3. 提交更改
git add .
git commit -m "Initial commit: BST manuscript site"

# 4. 推送到 GitHub
git push -u origin main
```

## ⚙️ GitHub Pages 配置

1. 访问仓库设置页面：
   https://github.com/zhangxin840/behavioral-simulation-theory/settings/pages

2. 配置 Pages：
   - **Source**: `GitHub Actions` ⚠️ 很重要！
   - 保存设置

3. 查看部署状态：
   https://github.com/zhangxin840/behavioral-simulation-theory/actions

## 🎉 部署验证

- [ ] GitHub Actions 运行成功（绿色✓）
- [ ] Pages 部署完成
- [ ] 站点可访问：https://zhangxin840.github.io/behavioral-simulation-theory/
- [ ] 首页加载正常
- [ ] 导航栏工作正常
- [ ] 侧边栏章节显示完整
- [ ] Markdown 内容渲染正确

## 📝 文件清单

确保以下文件已创建/更新：

- [x] `.github/workflows/deploy.yml` - GitHub Actions 部署配置
- [x] `deploy.sh` - 一键部署脚本
- [x] `DEPLOYMENT.md` - 详细部署文档
- [x] `QUICKSTART.md` - 快速开始指南
- [x] `DEPLOYMENT_CHECKLIST.md` - 本清单
- [x] `README.md` - 项目说明（已更新）
- [x] `.gitignore` - Git 忽略规则（已更新）

## 🔄 后续更新流程

每次更新内容后：

```bash
cd /Users/zhangxin/pci/book/site
./deploy.sh
```

或手动：

```bash
git add .
git commit -m "描述你的更改"
git push
```

## ⚠️ 常见问题

### Q1: 部署成功但显示 404
**原因**: GitHub Pages 未正确配置  
**解决**: 确保 Source 选择了 "GitHub Actions"，不是 "Deploy from a branch"

### Q2: 样式或图片加载失败
**原因**: baseUrl 配置问题  
**解决**: 检查 `docusaurus.config.js` 中 `baseUrl: '/behavioral-simulation-theory/'` 配置

### Q3: Actions 构建失败
**原因**: 依赖问题或 Node 版本  
**解决**: 
- 确保 `package-lock.json` 已提交
- 检查 Actions 日志中的错误信息

### Q4: 内容更新后站点未变化
**原因**: 缓存或未正确推送  
**解决**:
- 确认代码已推送: `git push`
- 清除浏览器缓存
- 等待 2-3 分钟让部署完成

## 📊 监控与维护

### 定期检查
- GitHub Actions 运行状态
- 站点可访问性
- 依赖更新 (`npm outdated`)

### 性能优化
- 图片压缩
- 代码分割
- CDN 配置（可选）

### 内容更新
- 在 `/Users/zhangxin/pci/book/manuscript/` 编辑内容
- 在 `/Users/zhangxin/pci/book/site/` 部署更新

---

## 📞 支持

如遇到问题：
1. 查看 [DEPLOYMENT.md](./DEPLOYMENT.md) 详细说明
2. 检查 [GitHub Actions](https://github.com/zhangxin840/behavioral-simulation-theory/actions) 日志
3. 访问 [Docusaurus 文档](https://docusaurus.io/docs)
4. 提交 [GitHub Issue](https://github.com/zhangxin840/behavioral-simulation-theory/issues)
