# 🚨 紧急修复：网站显示错误内容

## 问题诊断

✅ **网站可以访问**：https://zhangxin840.github.io/behavioral-simulation-theory/

❌ **但显示的是错误内容**：
- 当前：显示 Jekyll 渲染的 README.md
- 期望：显示 Docusaurus 构建的完整网站

## 根本原因

**GitHub Pages Source 设置错误** 🎯

当前配置：`Deploy from a branch` (main)
正确配置：`GitHub Actions`

## 立即修复（1 分钟）

### 第 1 步：打开设置页面

点击或访问：
```
https://github.com/zhangxin840/behavioral-simulation-theory/settings/pages
```

### 第 2 步：更改 Source

你会看到类似这样的界面：

```
Build and deployment

Source
┌─────────────────────────┐
│ Deploy from a branch  ▼ │  ← 当前设置（错误）
└─────────────────────────┘

Branch
┌────────┐  ┌─────────┐
│ main ▼ │  │ /(root) │
└────────┘  └─────────┘
```

**操作**：
1. 点击 **Source** 下拉菜单
2. 选择 **`GitHub Actions`**（不是 "Deploy from a branch"）
3. 自动保存

更改后应该显示：

```
Build and deployment

Source
┌─────────────────────────┐
│ GitHub Actions        ▼ │  ← 新设置（正确）
└─────────────────────────┘

Your site is being built from a GitHub Actions workflow.
```

### 第 3 步：等待重新部署

1. 访问 Actions 页面：
   ```
   https://github.com/zhangxin840/behavioral-simulation-theory/actions
   ```

2. 看到新的 "Deploy to GitHub Pages" workflow 正在运行

3. 等待 2-3 分钟，直到显示绿色 ✓

### 第 4 步：验证修复

1. **清除浏览器缓存**（重要！）
   - Chrome: Ctrl+Shift+Delete (Windows) 或 Cmd+Shift+Delete (Mac)
   - 或使用隐身模式

2. **重新访问**：https://zhangxin840.github.io/behavioral-simulation-theory/

3. **应该看到**：
   - ✅ Docusaurus 网站界面
   - ✅ "行为模拟论 · Manuscript Hub" 标题
   - ✅ 左侧导航栏
   - ✅ 完整的章节内容

---

## 为什么会出现这个问题？

当 GitHub Pages Source 设置为 "Deploy from a branch" 时：
- GitHub 会自动使用 **Jekyll** 来渲染 Markdown 文件
- 它找到了仓库根目录的 `README.md`
- 就用 Jekyll 把它渲染成了网页

这不是我们想要的！

**我们的正确流程**：
1. GitHub Actions 运行 `npm run build`
2. 生成 Docusaurus 静态网站到 `build/` 目录
3. 部署 `build/` 目录的内容到 GitHub Pages

这就是为什么必须选择 "GitHub Actions" 作为 Source。

---

## 一键检查脚本

运行此脚本自动检查和指导修复：

```bash
cd /Users/zhangxin/pci/book/site
./fix-pages-deployment.sh
```

---

## 修复后的效果对比

### 修复前（当前）
```
https://zhangxin840.github.io/behavioral-simulation-theory/

显示：
- 简单的 README.md 文本
- Jekyll 默认主题
- 没有导航、没有侧边栏
- 只有 GitHub 仓库的基本信息
```

### 修复后（期望）
```
https://zhangxin840.github.io/behavioral-simulation-theory/

显示：
- 专业的 Docusaurus 网站
- 完整的导航栏和侧边栏
- 所有书籍章节内容
- 搜索功能
- 响应式设计
```

---

## 验证检查清单

修复后确认以下所有项：

- [ ] Settings → Pages 显示 "Source: GitHub Actions"
- [ ] Actions 最新 run 显示绿色 ✓
- [ ] 访问网站看到 Docusaurus 界面
- [ ] 能看到完整的章节导航
- [ ] 内容可以正常浏览
- [ ] 搜索功能正常

全部打勾 = 修复成功！🎉

---

## 需要帮助？

如果按照上述步骤操作后仍有问题：

1. 查看 [TROUBLESHOOTING.md](./TROUBLESHOOTING.md)
2. 查看 [GITHUB_SETUP_GUIDE.md](./GITHUB_SETUP_GUIDE.md)
3. 检查 Actions 日志是否有错误

---

## 快速链接

- **Pages 设置**: https://github.com/zhangxin840/behavioral-simulation-theory/settings/pages
- **Actions 状态**: https://github.com/zhangxin840/behavioral-simulation-theory/actions
- **网站地址**: https://zhangxin840.github.io/behavioral-simulation-theory/

---

**现在就去修复！只需 1 分钟！** ⚡
