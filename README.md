# 行为模拟论 · Behavioral Simulation Theory

基于生成式智能代理的消费者洞察理论与实践专著的在线版本。

This Docusaurus 2 project hosts the online version of the Behavioral Simulation Theory book manuscript.

🌐 **Live Site**: [https://zhangxin840.github.io/behavioral-simulation-theory/](https://zhangxin840.github.io/behavioral-simulation-theory/)

## 快速开始 · Quick Start

### 1. 环境需求 · Requirements
- Node.js 18.14+ (Node 18 LTS recommended)
- npm or yarn
- Git

### 2. 安装依赖 · Installation
```bash
npm install
```

### 3. 本地开发 · Local Development
```bash
npm run start
```
访问 [http://localhost:3000](http://localhost:3000) 查看站点。内容修改会自动热重载。

### 4. 构建站点 · Build
```bash
npm run build
```
静态文件生成在 `build/` 目录。

### 5. 本地预览构建 · Serve Build
```bash
npm run serve
```

## 部署到 GitHub Pages · Deploy to GitHub Pages

### 快速部署
```bash
./deploy.sh
```

### 手动部署
查看 [DEPLOYMENT.md](./DEPLOYMENT.md) 获取详细部署说明。

## 内容编辑 · Content Editing

### 目录结构
```
manuscript/
├── front-matter/          # 前置内容
├── parts/                 # 书籍章节
│   ├── part-01-conceptual/
│   ├── part-02-foundations/
│   ├── part-03-methods/
│   ├── part-04-integration/
│   ├── part-05-applications/
│   └── part-06-futures-governance/
└── back-matter/          # 附录索引
```

### 添加新章节
1. 在相应的 `parts/part-XX-xxx/` 目录下创建 Markdown 文件
2. 使用数字前缀控制顺序，如 `07-new-chapter.md`
3. 侧边栏会自动生成

### 编辑现有内容
直接编辑 `manuscript/` 目录下的 Markdown 文件。Docusaurus 会自动读取这些文件。

## 项目配置 · Configuration

- **站点配置**: `docusaurus.config.js`
- **侧边栏**: `sidebars.js`
- **样式定制**: `src/css/custom.css`
- **部署流程**: `.github/workflows/deploy.yml`

## 依赖更新 · Update Dependencies

```bash
npm outdated        # 查看过期依赖
npm upgrade         # 更新依赖
```

## 相关项目 · Related Projects

- 📝 **内容源仓库**: [zhangxin840/pci](https://github.com/zhangxin840/pci) - 包含完整的手稿内容
- 🚀 **PCI 项目**: Predictive Consumer Insight 平台

## 技术栈 · Tech Stack

- [Docusaurus 2](https://docusaurus.io/) - 现代静态网站生成器
- React 17
- GitHub Pages - 托管服务
- GitHub Actions - CI/CD

## License

版权所有 © 2025 Predictive Consumer Insight
