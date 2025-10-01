# 🚀 现在就部署 · Deploy Now

## 快速部署指南 · Quick Deploy Guide

**状态:** ✅ 已修复 Node.js 版本问题，可以部署

---

## 一键部署 · One-Click Deploy

```bash
cd /Users/zhangxin/pci/book/site
./deploy.sh
```

脚本会自动：
1. 检查本地构建
2. 提交所有更改
3. 推送到 GitHub
4. 触发 GitHub Actions 部署

---

## 手动部署 · Manual Deploy

如果需要更多控制，请按以下步骤操作：

### 步骤 1: 验证本地构建

```bash
cd /Users/zhangxin/pci/book/site

# 确认使用 Node 20
node --version  # 应显示 v20.19.5

# 测试构建
npm run build  # 应该成功
```

**预期输出:**
```
✅ [SUCCESS] Generated static files in "build".
```

### 步骤 2: 提交更改

```bash
# 检查待提交的文件
git status

# 添加所有更改
git add .

# 提交（可自定义消息）
git commit -m "Upgrade to Docusaurus 3.9.1 + Node.js 20"
```

**已修改的关键文件:**
- ✅ `.github/workflows/deploy.yml` - Node.js 20
- ✅ `package.json` - 依赖升级 + engines 要求
- ✅ `docusaurus.config.js` - 配置更新
- ✅ `manuscript/parts/part-02-foundations/05-contextual-drivers.md` - MDX 修复

### 步骤 3: 推送到 GitHub

```bash
# 推送到 main 分支
git push origin main
```

### 步骤 4: 监控部署

1. **打开 Actions 页面:**
   ```
   https://github.com/zhangxin840/behavioral-simulation-theory/actions
   ```

2. **查看运行状态:**
   - 🟡 黄色圆圈 = 正在运行
   - ✅ 绿色勾号 = 成功
   - ❌ 红色 X = 失败

3. **等待完成:**
   - 通常需要 3-5 分钟
   - 第一次可能稍慢（构建缓存）

### 步骤 5: 验证部署

部署成功后：

1. **访问网站:**
   ```
   https://zhangxin840.github.io/behavioral-simulation-theory/
   ```

2. **检查内容:**
   - ✅ 首页正常显示
   - ✅ 导航栏工作
   - ✅ 侧边栏章节完整
   - ✅ 页面样式正确
   - ✅ 代码高亮正常

3. **检查版本:**
   - 打开浏览器开发者工具
   - 查看页面源码
   - 应能看到 React 18 相关标记

---

## 预期的 GitHub Actions 输出

### ✅ 成功的输出示例

```yaml
Setup Node.js
  ✓ Node.js version: 20.x.x
  ✓ npm version: 10.x.x

Install dependencies
  ✓ npm ci completed

Build website
  ✓ [SUCCESS] Generated static files in "build"
  
Upload artifact
  ✓ Artifact uploaded

Deploy to GitHub Pages
  ✓ Deployment successful
  ✓ URL: https://zhangxin840.github.io/behavioral-simulation-theory/
```

---

## 故障排除 · Troubleshooting

### 如果 Actions 失败

1. **查看错误日志:**
   - 点击失败的 workflow run
   - 展开失败的步骤
   - 查看详细错误信息

2. **常见问题:**

   **Node.js 版本错误**
   ```
   ✗ 症状: "Minimum Node.js version not met"
   ✓ 解决: 确认 .github/workflows/deploy.yml 使用 node-version: 20
   ```

   **构建失败**
   ```
   ✗ 症状: "MDX compilation failed"
   ✓ 解决: 检查 Markdown 文件中的特殊字符 (<, >, {, })
   ```

   **权限错误**
   ```
   ✗ 症状: "Permission denied"
   ✓ 解决: 检查 Settings → Actions → General → Workflow permissions
           需要 "Read and write permissions"
   ```

3. **重新运行:**
   - 点击 "Re-run jobs"
   - 选择 "Re-run all jobs"

---

## 部署后检查清单

- [ ] GitHub Actions 显示绿色勾号 ✅
- [ ] 网站可访问（无 404）
- [ ] 首页内容正确
- [ ] 所有章节链接正常
- [ ] 图片和资源加载
- [ ] 代码块高亮正常
- [ ] 搜索功能工作
- [ ] 移动端显示正常

---

## 更新频率建议

### 内容更新
```bash
# 编辑 manuscript/ 中的文件后
cd /Users/zhangxin/pci/book/site
./deploy.sh
```

### 定期维护
- **每周:** 检查是否有内容需要更新
- **每月:** 运行 `npm outdated` 检查依赖
- **每季度:** 考虑升级依赖包（测试后）

---

## 快速命令参考

```bash
# 本地开发
npm run start

# 本地构建测试
npm run build

# 本地预览构建
npm run serve

# 部署到 GitHub Pages
./deploy.sh

# 检查 Node 版本
node --version

# 检查 Docusaurus 版本
npm list @docusaurus/core --depth=0
```

---

## 紧急回滚

如果部署出现严重问题需要回滚：

```bash
# 1. 查看提交历史
git log --oneline

# 2. 回滚到上一个工作版本
git revert HEAD

# 3. 推送回滚
git push origin main
```

或者在 GitHub 上：
1. 访问 Settings → Pages
2. 选择之前的成功部署

---

## 支持资源

- **部署文档:** [DEPLOYMENT.md](./DEPLOYMENT.md)
- **升级总结:** [UPGRADE_SUMMARY.md](./UPGRADE_SUMMARY.md)
- **故障排除:** [TROUBLESHOOTING.md](./TROUBLESHOOTING.md)
- **部署修复:** [DEPLOYMENT_FIX.md](./DEPLOYMENT_FIX.md)

---

**准备好了吗？运行部署命令!** 🚀

```bash
cd /Users/zhangxin/pci/book/site && ./deploy.sh
```

