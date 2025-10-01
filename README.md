# 行为模拟论 · Behavioral Simulation Theory

基于生成式智能代理的消费者洞察理论与实践专著的在线版本。

This Docusaurus site hosts the online version of the Behavioral Simulation Theory book manuscript.

🌐 **Live Site**: [https://zhangxin840.github.io/behavioral-simulation-theory/](https://zhangxin840.github.io/behavioral-simulation-theory/)

---

## 快速开始 · Quick Start

### 本地开发 · Local Development

```bash
# 1. 安装依赖
npm install

# 2. 启动开发服务器
npm run start

# 3. 访问 http://localhost:3000 查看站点
# 内容修改会自动热重载
```

### 构建与预览 · Build & Preview

```bash
# 构建生产版本
npm run build

# 预览构建结果
npm run serve
```

---

## 内容管理 · Content Management

### 内容来源
本站点内容来自 `manuscript/` 目录，该目录包含完整的书籍手稿：

```
manuscript/
├── front-matter/          # 前言与导读
├── parts/                 # 六大部分，19个章节
│   ├── part-01-conceptual/        # 第一部分：认识框架
│   ├── part-02-foundations/       # 第二部分：理论基础
│   ├── part-03-methods/           # 第三部分：方法体系
│   ├── part-04-integration/       # 第四部分：范式对比
│   ├── part-05-applications/      # 第五部分：应用实践
│   └── part-06-futures-governance/ # 第六部分：未来治理
└── back-matter/          # 附录与索引
```

### 编辑内容
- 直接编辑 `manuscript/` 目录下的 Markdown 文件
- 侧边栏会自动根据文件结构生成
- 使用数字前缀控制章节顺序（如 `01-chapter.md`）

---

## 部署 · Deployment

### GitHub Pages 自动部署
推送到 `main` 分支后，GitHub Actions 会自动构建并部署到 GitHub Pages。

### 手动部署
```bash
./deploy.sh
```

详细部署说明请查看 [DEPLOYMENT.md](./DEPLOYMENT.md)

---

## 项目配置 · Configuration

| 文件 | 用途 |
|------|------|
| `docusaurus.config.js` | 站点主配置 |
| `sidebars.js` | 侧边栏结构 |
| `src/css/custom.css` | 自定义样式 |
| `.github/workflows/deploy.yml` | CI/CD 配置 |

---

## 技术栈 · Tech Stack

- **框架**: Docusaurus 3.9.1 ✨
- **前端**: React 18
- **Node.js**: v20.19.5 LTS
- **部署**: GitHub Pages + GitHub Actions
- **内容**: Markdown + MDX v3

---

## 维护指南 · Maintenance

### 更新依赖
```bash
# 查看过期依赖
npm outdated

# 升级 Docusaurus（可选）
npm i @docusaurus/core@latest @docusaurus/preset-classic@latest
```

### 故障排除
遇到问题请查看 [TROUBLESHOOTING.md](./TROUBLESHOOTING.md)

---

## 相关资源 · Related Resources

- 📖 **完整项目**: [zhangxin840/pci](https://github.com/zhangxin840/pci)
- 🚀 **PCI 平台**: Predictive Consumer Insight

---

**版权所有 © 2025 Predictive Consumer Insight**
