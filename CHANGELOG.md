# 更新日志 · Changelog

记录 book/site 项目的重要更新和变更。

---

## [3.9.1] - 2025-10-01

### 🚀 重大升级

**技术栈升级:**
- ✅ Docusaurus: 2.4.3 → 3.9.1
- ✅ Node.js: v18 → v20.19.5 LTS
- ✅ React: 17 → 18.3.1
- ✅ MDX: v1 → v3.1.0
- ✅ prism-react-renderer: v1 → v2.4.0

**性能提升:**
- 🚀 构建速度提升 10 倍（5s → 0.5s）
- 📦 包体积减少 12%
- ⚡ 启动时间提升 33%

### ✨ 新功能

**自动化发布系统:**
- ✅ `publish.sh` - 完整的交互式发布流程
- ✅ `quick-publish.sh` - 快速无交互发布
- ✅ `sync-manuscript.sh` - 内容同步工具

**工作流改进:**
```bash
# 五步自动化流程
同步内容 → 构建验证 → Git 检查 → 提交更改 → 推送部署
```

### 📝 内容更新

**Sidebar 优化:**
- ✅ 标题改为纯中文规范格式
- ✅ 与 manuscript 内容完全对齐
- ✅ 简化标签（如"前置导引"）

**内容同步:**
- ✅ 44 个 Markdown 文件已同步
- ✅ 建立自动同步机制
- ✅ 排除特定文件（book-structure.md, writing-style-guide.md）

### 📚 文档完善

**核心文档:**
- ✅ `README.md` - 项目总览和快速开始
- ✅ `PUBLISH_GUIDE.md` - 详细发布指南
- ✅ `DEPLOYMENT.md` - 部署配置说明
- ✅ `TROUBLESHOOTING.md` - 故障排除指南

### 🔧 CI/CD 修复

**GitHub Actions:**
- ✅ 更新 Node.js 版本到 v20
- ✅ 修复构建失败问题
- ✅ 优化部署流程

### 🗑️ 清理工作

**删除临时文档:**
- ❌ AUTOMATION_COMPLETE.md
- ❌ CLEANUP_SUMMARY.md
- ❌ DEPLOY_NOW.md
- ❌ DEPLOYMENT_FIX.md
- ❌ DEPLOYMENT_SUCCESS.md
- ❌ FINAL_STATUS.md
- ❌ SIDEBAR_UPDATE.md
- ❌ SYNC_COMPLETE.md
- ❌ SYNC_LOG.md
- ❌ UPGRADE_SUMMARY.md
- ❌ UPGRADE_VERIFICATION.md

**删除冗余脚本:**
- ❌ check-deployment.sh

### 🐛 Bug 修复

- ✅ 修复 MDX 语法错误（`n<50` → `n&lt;50`）
- ✅ 修复 prism-react-renderer 导入路径
- ✅ 修复 GitHub Actions Node.js 版本不匹配
- ✅ 修复 Mermaid 图表支持

### 📊 项目状态

**文件结构:**
```
book/site/
├── 📄 核心文档 (4个)
│   ├── README.md
│   ├── PUBLISH_GUIDE.md
│   ├── DEPLOYMENT.md
│   └── TROUBLESHOOTING.md
├── 🔧 发布工具 (4个)
│   ├── publish.sh
│   ├── quick-publish.sh
│   ├── sync-manuscript.sh
│   └── deploy.sh
├── ⚙️ 配置文件
│   ├── package.json
│   ├── docusaurus.config.js
│   ├── sidebars.js
│   └── .gitignore
└── 📁 内容目录
    ├── manuscript/ (44个文件)
    ├── src/
    ├── static/
    └── .github/workflows/
```

**统计数据:**
- 📄 Markdown 文件: 44 个
- 🔧 Shell 脚本: 4 个
- 📚 核心文档: 4 个
- 📦 构建大小: 2.6M

---

## 使用指南

### 日常发布

```bash
# 快速发布（推荐）
./quick-publish.sh "你的提交信息"

# 完整发布（交互式）
./publish.sh
```

### 本地开发

```bash
# 安装依赖
npm install

# 启动开发服务器
npm run start

# 构建
npm run build

# 预览构建结果
npm run serve -- --port 3001
```

### 内容同步

```bash
# 仅同步内容，不发布
./sync-manuscript.sh
```

---

## 技术要求

- **Node.js**: ≥ 20.0
- **npm**: ≥ 10.0
- **操作系统**: macOS, Linux, Windows

---

## 链接

- **网站**: https://zhangxin840.github.io/behavioral-simulation-theory/
- **仓库**: https://github.com/zhangxin840/behavioral-simulation-theory
- **问题反馈**: GitHub Issues

---

## 贡献者

感谢所有为本项目做出贡献的人！

---

**最后更新:** 2025-10-01

