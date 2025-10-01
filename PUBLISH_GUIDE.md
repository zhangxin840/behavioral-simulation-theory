# 📚 发布指南 · Publishing Guide

完整的内容同步与网站发布流程说明。

---

## 🎯 快速参考

| 场景 | 命令 | 说明 |
|------|------|------|
| **日常更新并发布** | `./publish.sh` | 推荐使用，包含交互式确认 |
| **自动化发布** | `./quick-publish.sh` | CI/CD 友好，无需交互 |
| **仅同步内容** | `./sync-manuscript.sh` | 不提交不推送，仅验证 |
| **传统方式** | `./deploy.sh` | 仅 Git 提交推送，不同步内容 |

---

## 📝 完整工作流程

### 方式一：完整发布流程（推荐）

适合日常内容更新后发布到 GitHub Pages。

#### 1. 编辑内容
```bash
# 在主 manuscript 目录编辑内容
cd /Users/zhangxin/pci/book/manuscript
vim parts/part-01-conceptual/01-defining-the-field.md
# 编辑、保存...
```

#### 2. 运行发布脚本
```bash
cd /Users/zhangxin/pci/book/site
./publish.sh
```

#### 3. 按提示操作
脚本会自动：
1. ✅ 同步 manuscript 内容到 site/manuscript
2. ✅ 运行构建验证（`npm run build`）
3. ✅ 显示更改的文件
4. ✅ 请求输入提交信息（可留空使用默认）
5. ✅ 提交并推送到 GitHub
6. ✅ 显示部署链接

#### 4. 验证部署
- 访问 [GitHub Actions](https://github.com/zhangxin840/behavioral-simulation-theory/actions) 查看部署状态
- 等待 2-3 分钟后访问 [网站](https://zhangxin840.github.io/behavioral-simulation-theory/)

---

### 方式二：快速发布（无交互）

适合 CI/CD 自动化、定时任务或脚本调用。

#### 基本用法
```bash
./quick-publish.sh
```

#### 自定义提交信息
```bash
./quick-publish.sh "更新第三章：方法体系"
```

#### 特点
- ✅ 全自动，无需用户输入
- ✅ 静默模式，输出简洁
- ✅ 失败时返回非零退出码

#### 在 cron 中使用
```bash
# 每天凌晨 2 点自动发布
0 2 * * * cd /Users/zhangxin/pci/book/site && ./quick-publish.sh >> /tmp/publish.log 2>&1
```

---

### 方式三：仅同步内容（不发布）

适合本地开发和测试。

```bash
./sync-manuscript.sh
```

#### 流程
1. ✅ 从 `/book/manuscript/` 同步内容
2. ✅ 运行构建验证
3. ✅ 显示统计信息
4. ❌ 不提交不推送

#### 用途
- 本地预览最新内容
- 验证构建是否成功
- 测试内容更改

---

## 🔄 日常工作流示例

### 场景 1: 更新单个章节

```bash
# 1. 编辑内容
cd /Users/zhangxin/pci/book/manuscript
vim parts/part-03-methods/06-agent-construction.md

# 2. 发布
cd /Users/zhangxin/pci/book/site
./publish.sh
# 输入提交信息: "完善代理构建方法章节"
```

### 场景 2: 批量更新多个文件

```bash
# 1. 编辑多个文件
cd /Users/zhangxin/pci/book/manuscript
vim parts/part-05-applications/14-consumer-applications.md
vim parts/part-05-applications/15-enterprise-services.md
vim parts/part-05-applications/16-scientific-research.md

# 2. 本地预览
cd /Users/zhangxin/pci/book/site
./sync-manuscript.sh
npm run serve -- --port 3001
# 在浏览器中验证...

# 3. 确认无误后发布
./publish.sh
# 输入提交信息: "更新应用实践部分三个章节"
```

### 场景 3: 紧急修复错别字

```bash
cd /Users/zhangxin/pci/book/site
./quick-publish.sh "修复第二章错别字"
```

---

## 📊 脚本详细说明

### publish.sh

**完整的五步发布流程**

```
[步骤 1/5] 📄 同步 manuscript 内容
  ↓
[步骤 2/5] 🔨 构建并验证
  ↓
[步骤 3/5] 📋 检查 Git 状态
  ↓
[步骤 4/5] 💾 提交更改
  ↓
[步骤 5/5] 🚀 推送到 GitHub
```

**特点：**
- 交互式，每步都有确认
- 彩色输出，清晰易读
- 详细的统计和链接
- 错误处理和提示

### quick-publish.sh

**简化的快速流程**

```
同步 → 构建 → 提交 → 推送
```

**特点：**
- 无交互，全自动
- 简洁输出
- 支持自定义提交信息
- 适合脚本调用

### sync-manuscript.sh

**仅同步和验证**

```
同步 → 构建 → 显示统计
```

**特点：**
- 不修改 Git 状态
- 安全的预览工具
- 彩色友好的输出

---

## 🛡️ 安全检查

所有脚本都包含以下安全措施：

### 1. 构建验证
```bash
# 如果构建失败，立即停止
if ! npm run build; then
    echo "❌ 构建失败"
    exit 1
fi
```

### 2. 目录检查
```bash
# 确保在正确的目录
if [ ! -f "docusaurus.config.js" ]; then
    echo "❌ 错误: 请在 book/site/ 目录下运行"
    exit 1
fi
```

### 3. 源目录验证
```bash
# 确保 manuscript 目录存在
if [ ! -d "$SOURCE_DIR" ]; then
    echo "❌ 源目录不存在"
    exit 1
fi
```

### 4. 文件保护
```bash
# 保留 site 特有文件
rsync --exclude='book-structure.md' \
      --exclude='writing-style-guide.md'
```

---

## 🔧 故障排除

### 问题 1: 推送失败

**错误信息：**
```
❌ 推送失败
fatal: unable to access 'https://github.com/...': Could not resolve host
```

**解决方案：**
```bash
# 检查网络连接
ping github.com

# 或使用 SSH
git remote set-url origin git@github.com:zhangxin840/behavioral-simulation-theory.git
```

### 问题 2: 构建失败

**错误信息：**
```
❌ 构建失败
MDX compilation failed
```

**解决方案：**
```bash
# 查看详细错误
npm run build

# 检查 MDX 语法
# 常见问题: <, >, {, } 需要转义
# n<50 → n&lt;50
```

### 问题 3: 远程有新更改

**错误信息：**
```
! [rejected] main -> main (fetch first)
```

**解决方案：**
```bash
# 拉取远程更改
git pull origin main --rebase

# 再次推送
git push origin main
```

### 问题 4: 权限问题

**错误信息：**
```
Permission denied (publickey)
```

**解决方案：**
```bash
# 使用 HTTPS 而非 SSH
git remote set-url origin https://github.com/zhangxin840/behavioral-simulation-theory.git

# 或配置 SSH 密钥
ssh-keygen -t ed25519 -C "your_email@example.com"
# 将公钥添加到 GitHub
```

---

## 📈 部署监控

### 查看部署状态

**GitHub Actions:**
```
https://github.com/zhangxin840/behavioral-simulation-theory/actions
```

**状态说明：**
- 🟡 黄色圆圈 = 正在运行
- ✅ 绿色勾号 = 成功
- ❌ 红色 X = 失败

### 部署时间

| 部署类型 | 预期时间 |
|---------|---------|
| 首次部署 | 3-5 分钟 |
| 后续部署 | 2-3 分钟 |
| 缓存命中 | 1-2 分钟 |

### 验证部署

```bash
# 访问网站
open https://zhangxin840.github.io/behavioral-simulation-theory/

# 或使用 curl 检查
curl -I https://zhangxin840.github.io/behavioral-simulation-theory/
```

---

## 🎨 自定义配置

### 修改同步排除规则

编辑 `publish.sh` 或 `sync-manuscript.sh`:

```bash
rsync -av --delete \
    --exclude='book-structure.md' \
    --exclude='writing-style-guide.md' \
    --exclude='your-custom-file.md' \  # 添加新的排除
    "$SOURCE_DIR/" "$TARGET_DIR/"
```

### 修改默认提交信息

编辑 `quick-publish.sh`:

```bash
# 修改这一行
COMMIT_MSG="${1:-你的自定义默认信息 - $(date +%Y-%m-%d)}"
```

### 添加发布前钩子

在 `publish.sh` 中添加：

```bash
# 在步骤 1 之前
echo "运行自定义检查..."
./your-custom-check.sh
```

---

## 📋 发布检查清单

### 发布前
- [ ] 内容已在 manuscript 目录编辑完成
- [ ] 本地构建成功（`npm run build`）
- [ ] 本地预览验证（`npm run serve`）
- [ ] 检查 MDX 语法（特殊字符转义）
- [ ] 图片链接正确

### 发布中
- [ ] 提交信息清晰描述了更改
- [ ] 推送成功
- [ ] GitHub Actions 开始运行

### 发布后
- [ ] Actions 显示绿色 ✅
- [ ] 网站可访问
- [ ] 导航正常
- [ ] 内容显示正确
- [ ] 搜索功能正常（如启用）

---

## 🔗 相关资源

- **[README.md](./README.md)** - 项目总览
- **[DEPLOYMENT.md](./DEPLOYMENT.md)** - 部署详细说明
- **[SYNC_LOG.md](./SYNC_LOG.md)** - 同步日志
- **[TROUBLESHOOTING.md](./TROUBLESHOOTING.md)** - 故障排除
- **[UPGRADE_SUMMARY.md](./UPGRADE_SUMMARY.md)** - 升级记录

---

## 💡 最佳实践

### 1. 频繁提交
```bash
# 每完成一个小改动就发布
./quick-publish.sh "添加案例：金融服务"
```

### 2. 清晰的提交信息
```bash
# 好的提交信息
./quick-publish.sh "第14章：添加电商推荐实施路径"

# 避免
./quick-publish.sh "更新"
```

### 3. 发布前本地验证
```bash
# 先同步和预览
./sync-manuscript.sh
npm run serve -- --port 3001

# 确认无误后发布
./publish.sh
```

### 4. 定期备份
```bash
# 定期创建标签
git tag -a v1.0 -m "第一版完成"
git push origin v1.0
```

---

**准备好了吗？运行 `./publish.sh` 开始发布！** 🚀

