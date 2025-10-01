# 🚀 GitHub 仓库快速配置指南
# Quick GitHub Repository Configuration

## 📍 你现在需要做的事情（按顺序）

---

### 第 1 步：启用 GitHub Pages

🔗 **打开这个链接**：
```
https://github.com/zhangxin840/behavioral-simulation-theory/settings/pages
```

📋 **操作**：
1. 找到 **"Source"** 下拉菜单
2. 点击下拉菜单
3. 选择 **`GitHub Actions`** （不是 "Deploy from a branch"）
4. 会自动保存

✅ **成功标志**：页面显示 "Your site is being built from a GitHub Actions workflow"

⏱️ **耗时**：30 秒

---

### 第 2 步：设置 Actions 权限

🔗 **打开这个链接**：
```
https://github.com/zhangxin840/behavioral-simulation-theory/settings/actions
```

📋 **操作**：
1. 向下滚动到 **"Workflow permissions"** 部分
2. 选择 **"Read and write permissions"** （第二个单选按钮）
3. 勾选 **"Allow GitHub Actions to create and approve pull requests"**
4. 点击 **Save** 按钮

✅ **成功标志**：页面顶部显示 "Settings saved"

⏱️ **耗时**：30 秒

---

### 第 3 步：查看部署状态

🔗 **打开这个链接**：
```
https://github.com/zhangxin840/behavioral-simulation-theory/actions
```

📋 **查看**：
- 应该看到一个 "Deploy to GitHub Pages" workflow 正在运行
- 状态：
  - 🟡 黄色圆圈 = 正在运行
  - ✅ 绿色勾 = 成功
  - ❌ 红色 X = 失败（查看错误日志）

⏱️ **等待时间**：2-3 分钟

---

### 第 4 步：访问网站

🔗 **打开这个链接**：
```
https://zhangxin840.github.io/behavioral-simulation-theory/
```

✅ **成功标志**：
- 看到 "行为模拟论 · Manuscript Hub"
- 导航栏和侧边栏正常显示
- 内容可以正常浏览

---

## 🎯 核心配置（2 分钟完成）

| 步骤 | 链接 | 操作 | 设置 |
|------|------|------|------|
| 1 | [Pages 设置](https://github.com/zhangxin840/behavioral-simulation-theory/settings/pages) | Source 下拉菜单 | 选择 `GitHub Actions` |
| 2 | [Actions 设置](https://github.com/zhangxin840/behavioral-simulation-theory/settings/actions) | Workflow permissions | 选择 `Read and write` |
| 3 | [查看 Actions](https://github.com/zhangxin840/behavioral-simulation-theory/actions) | 等待部署完成 | 看到绿色 ✓ |
| 4 | [访问网站](https://zhangxin840.github.io/behavioral-simulation-theory/) | 打开浏览器 | 看到网站内容 |

---

## 🖼️ 可视化流程

```
步骤 1: Pages 设置
┌──────────────────────────────────────┐
│ Settings → Pages                     │
│                                      │
│ Source: [GitHub Actions ▼]          │  ← 选这个
│                                      │
└──────────────────────────────────────┘
              ↓
              
步骤 2: Actions 权限
┌──────────────────────────────────────┐
│ Settings → Actions → General         │
│                                      │
│ Workflow permissions:                │
│ ● Read and write permissions         │  ← 选这个
│ ☑ Allow Actions to create PRs        │  ← 勾选
│                                      │
└──────────────────────────────────────┘
              ↓
              
步骤 3: 等待部署
┌──────────────────────────────────────┐
│ Actions 页面                         │
│                                      │
│ ✓ Deploy to GitHub Pages #1         │  ← 绿色勾
│   Completed 2 minutes ago            │
│                                      │
└──────────────────────────────────────┘
              ↓
              
步骤 4: 访问网站
┌──────────────────────────────────────┐
│ https://zhangxin840.github.io/       │
│ behavioral-simulation-theory/        │
│                                      │
│ 🎉 网站上线成功！                    │
│                                      │
└──────────────────────────────────────┘
```

---

## ❌ 如果第 1 步看不到 "GitHub Actions" 选项

这时候需要先"激活" Pages：

1. Source 先选择 **`Deploy from a branch`**
2. Branch 选择 **`main`** + **`/ (root)`**
3. 点击 **Save**
4. 等待页面刷新（约 10 秒）
5. 再次点击 Source 下拉菜单
6. 这时应该能看到 **`GitHub Actions`** 选项了
7. 选择它并保存

---

## ⚡ 最常见的错误

### 错误 1: "Failed to create deployment (status: 404)"

**原因**：第 1 步没做 - Pages 没启用

**解决**：去 Settings → Pages，选择 GitHub Actions

---

### 错误 2: "Permission denied"

**原因**：第 2 步没做 - Actions 权限不足

**解决**：去 Settings → Actions，选择 Read and write permissions

---

### 错误 3: 网站显示 404

**原因**：
- 部署还没完成（等几分钟）
- Pages Source 设置错误（应该是 GitHub Actions）
- 浏览器缓存（清除缓存或用隐身模式）

**解决**：
1. 确认 Actions 显示绿色 ✓
2. 确认 Pages 设置正确
3. 清除浏览器缓存

---

## 📱 移动端配置

如果你在手机上操作：

1. 在 GitHub 手机 App 中无法配置 Pages
2. 需要使用浏览器访问 GitHub 网页版
3. 建议用电脑操作更方便

---

## ✅ 配置成功检查表

配置完成后，确认以下所有项：

- [ ] Pages 页面显示 "Your site is live at..."
- [ ] Actions 最新运行显示绿色 ✓
- [ ] 能访问 https://zhangxin840.github.io/behavioral-simulation-theory/
- [ ] 网站内容、样式正常
- [ ] 导航和搜索功能正常

**全部打勾 = 配置成功！** 🎉

---

## 🆘 需要详细说明？

查看完整配置指南：
- [GITHUB_SETUP_GUIDE.md](./GITHUB_SETUP_GUIDE.md) - 详细配置说明（含截图描述）
- [TROUBLESHOOTING.md](./TROUBLESHOOTING.md) - 故障排除指南
- [DEPLOYMENT.md](./DEPLOYMENT.md) - 部署文档

---

## 💡 提示

- ⏱️ 整个配置过程只需 **2 分钟**
- 🔑 最关键的是**第 1 步**（启用 Pages）
- 📊 配置一次后，以后推送代码会自动部署
- 🔄 不需要每次都重新配置
