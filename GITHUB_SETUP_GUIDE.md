# GitHub 仓库配置完整指南
# Complete GitHub Repository Setup Guide

本指南将帮助你正确配置 GitHub 仓库以启用 GitHub Pages 部署。

---

## 📋 配置步骤总览

1. ✅ 启用 GitHub Pages
2. ✅ 配置 Actions 权限
3. ✅ 触发部署
4. ✅ 验证结果

---

## 第一步：启用 GitHub Pages（最关键！）

### 1.1 打开仓库设置页面

在浏览器中访问：
```
https://github.com/zhangxin840/behavioral-simulation-theory/settings/pages
```

或者：
1. 打开仓库主页：https://github.com/zhangxin840/behavioral-simulation-theory
2. 点击顶部的 **Settings** 标签
3. 在左侧菜单中找到并点击 **Pages**

### 1.2 配置 Build and deployment

你会看到 "Build and deployment" 部分：

```
┌─────────────────────────────────────────────────────┐
│ Build and deployment                                │
│                                                     │
│ Source                                              │
│ ┌─────────────────────┐                            │
│ │ GitHub Actions    ▼ │  ← 点击这个下拉菜单        │
│ └─────────────────────┘                            │
│                                                     │
│ Use GitHub Actions workflows to build and deploy   │
│ your site. Learn more                              │
└─────────────────────────────────────────────────────┘
```

**重要操作**：
1. 点击 **Source** 下拉菜单
2. 从选项中选择：**`GitHub Actions`**
3. 选项列表通常是：
   - `Deploy from a branch` ← 不要选这个
   - `GitHub Actions` ← **选择这个！**

### 1.3 如果看不到 GitHub Actions 选项

如果下拉菜单中只有 "Deploy from a branch"：

**临时解决方案**：
1. 先选择 `Deploy from a branch`
2. Branch 选择：`main` + `/ (root)`
3. 点击 **Save**
4. 等待页面刷新
5. 再次点击 Source 下拉菜单
6. 这时应该能看到 `GitHub Actions` 选项了
7. 选择 `GitHub Actions`

### 1.4 验证配置成功

配置成功后，页面会显示：

```
┌─────────────────────────────────────────────────────┐
│ Build and deployment                                │
│                                                     │
│ Source                                              │
│ GitHub Actions                                      │
│                                                     │
│ Your site is being built from a GitHub Actions     │
│ workflow. View runs                                 │
└─────────────────────────────────────────────────────┘
```

---

## 第二步：配置 Actions 权限

### 2.1 打开 Actions 设置页面

访问：
```
https://github.com/zhangxin840/behavioral-simulation-theory/settings/actions
```

或者：
1. 在仓库设置页面
2. 左侧菜单点击 **Actions** → **General**

### 2.2 配置 Workflow permissions

向下滚动找到 **"Workflow permissions"** 部分：

```
┌─────────────────────────────────────────────────────┐
│ Workflow permissions                                │
│                                                     │
│ Choose whether GitHub Actions can create pull      │
│ requests or submit approving pull request reviews. │
│                                                     │
│ ○ Read repository contents and packages            │
│   permissions                                       │
│                                                     │
│ ● Read and write permissions                       │  ← 选择这个
│                                                     │
│ ☑ Allow GitHub Actions to create and approve       │  ← 勾选这个
│   pull requests                                     │
└─────────────────────────────────────────────────────┘
```

**操作**：
1. 选择 **"Read and write permissions"** （第二个选项）
2. 勾选 **"Allow GitHub Actions to create and approve pull requests"**
3. 点击底部的 **Save** 按钮

---

## 第三步：触发部署

配置完成后，有两种方式触发部署：

### 方式 A: 自动触发（推荐）

配置完 GitHub Pages 后，会自动触发一次部署。你可以：

1. 访问 Actions 页面查看：
   ```
   https://github.com/zhangxin840/behavioral-simulation-theory/actions
   ```

2. 应该看到一个新的 workflow run 正在运行

### 方式 B: 手动触发

如果自动部署没有触发：

1. 访问：https://github.com/zhangxin840/behavioral-simulation-theory/actions

2. 左侧点击 **"Deploy to GitHub Pages"**

3. 右上角点击 **"Run workflow"** 按钮

4. 出现的下拉菜单中：
   ```
   ┌─────────────────────────────┐
   │ Use workflow from           │
   │ Branch: main              ▼ │
   │                             │
   │ [  Run workflow  ]          │
   └─────────────────────────────┘
   ```

5. 确认分支是 `main`

6. 点击绿色的 **"Run workflow"** 按钮

---

## 第四步：监控部署进度

### 4.1 查看 Actions 运行状态

1. 访问：https://github.com/zhangxin840/behavioral-simulation-theory/actions

2. 你会看到 workflow runs 列表：
   ```
   All workflows
   
   Deploy to GitHub Pages
   
   ● Deploy to GitHub Pages #3          ← 黄色圆圈 = 运行中
     main  cf44fae  2 minutes ago
   
   ✓ Deploy to GitHub Pages #2          ← 绿色勾 = 成功
     main  ada468a  10 minutes ago
   
   ✗ Deploy to GitHub Pages #1          ← 红色 X = 失败
     main  908c29e  20 minutes ago
   ```

### 4.2 查看详细日志

点击任意 workflow run 可以看到详细步骤：

```
Jobs
  build   ← 点击展开
  deploy  ← 点击展开
```

每个 job 下有多个步骤，可以查看每步的输出。

### 4.3 等待完成

- **黄色圆圈** 🟡 = 正在运行
- **绿色勾** ✅ = 成功
- **红色 X** ❌ = 失败

通常需要 **2-3 分钟**完成。

---

## 第五步：验证部署成功

### 5.1 检查 Pages 状态

返回 Pages 设置页面：
```
https://github.com/zhangxin840/behavioral-simulation-theory/settings/pages
```

成功后会显示：

```
┌─────────────────────────────────────────────────────┐
│ ✓ Your site is live at                             │
│   https://zhangxin840.github.io/                    │
│   behavioral-simulation-theory/                     │
│                                                     │
│ Last deployed by github-actions[bot]                │
│ 2 minutes ago from cf44fae                          │
└─────────────────────────────────────────────────────┘
```

### 5.2 访问网站

在浏览器中打开：
```
https://zhangxin840.github.io/behavioral-simulation-theory/
```

你应该看到：
- ✅ 页面标题："行为模拟论 · Manuscript Hub"
- ✅ 导航栏：Manuscript、内容总览、GitHub
- ✅ 左侧边栏显示章节目录
- ✅ 内容正确显示

### 5.3 测试功能

- [ ] 导航栏链接可点击
- [ ] 侧边栏章节可展开/折叠
- [ ] 页面间跳转正常
- [ ] 搜索功能工作
- [ ] 图片正常加载

---

## 🎯 配置检查清单

完成以下所有项目：

### GitHub Pages 设置
- [ ] 访问 Settings → Pages
- [ ] Source 选择 "GitHub Actions"
- [ ] 看到 "Your site is being built..." 消息

### Actions 权限
- [ ] 访问 Settings → Actions → General
- [ ] 选择 "Read and write permissions"
- [ ] 勾选 "Allow GitHub Actions to create and approve pull requests"
- [ ] 点击 Save

### 部署验证
- [ ] Actions 页面有新的 workflow run
- [ ] Workflow run 状态为绿色 ✓
- [ ] Pages 页面显示 "Your site is live at..."
- [ ] 能够访问站点 URL

---

## 🔧 故障排除

### 问题 1: 404 Not Found

**症状**：访问站点显示 GitHub 404 页面

**解决**：
1. 确认 GitHub Pages Source 设置为 "GitHub Actions"
2. 等待 2-3 分钟让部署完成
3. 清除浏览器缓存
4. 尝试隐身模式访问

### 问题 2: Workflow 失败

**症状**：Actions 显示红色 X

**解决**：
1. 点击失败的 workflow run
2. 查看错误日志
3. 常见错误：
   - 权限问题 → 检查 Actions 权限设置
   - 构建失败 → 检查代码是否有错误
   - 404 错误 → 确认 Pages 已启用

### 问题 3: 看不到 GitHub Actions 选项

**症状**：Source 下拉菜单只有 "Deploy from a branch"

**解决**：
1. 先选择 "Deploy from a branch"
2. 选择 main 分支和 / (root)
3. Save 后等待
4. 再次打开 Source 菜单
5. 应该能看到 "GitHub Actions" 选项

### 问题 4: 样式/资源加载失败

**症状**：页面显示但样式错乱

**解决**：
1. 检查 `docusaurus.config.js` 中的 `baseUrl`
2. 应该是：`baseUrl: '/behavioral-simulation-theory/'`
3. 清除浏览器缓存

---

## 📞 需要帮助？

如果按照以上步骤仍然遇到问题：

1. **查看详细文档**：
   - [TROUBLESHOOTING.md](./TROUBLESHOOTING.md)
   - [DEPLOYMENT.md](./DEPLOYMENT.md)

2. **运行诊断脚本**：
   ```bash
   cd /Users/zhangxin/pci/book/site
   ./check-deployment.sh
   ```

3. **查看官方文档**：
   - [GitHub Pages 文档](https://docs.github.com/en/pages)
   - [GitHub Actions 文档](https://docs.github.com/en/actions)
   - [Docusaurus 部署指南](https://docusaurus.io/docs/deployment)

---

## ✅ 配置成功标志

当你看到以下所有内容时，说明配置成功：

1. ✅ Settings → Pages 显示 "Your site is live at..."
2. ✅ Actions 最新 run 显示绿色 ✓
3. ✅ 访问 https://zhangxin840.github.io/behavioral-simulation-theory/ 能看到网站
4. ✅ 网站内容、样式、功能都正常

**恭喜！你的网站已成功部署到 GitHub Pages！** 🎉

