# 内容同步日志 · Content Sync Log

**日期 Date:** 2025-10-01  
**操作 Action:** 同步 manuscript 到 site

---

## 同步摘要 · Sync Summary

### 同步范围
- **源目录:** `/book/manuscript/`
- **目标目录:** `/book/site/manuscript/`
- **同步文件数:** 44 个 Markdown 文件
- **保留文件:** `book-structure.md`, `writing-style-guide.md`

### 同步内容

#### 前言部分 · Front Matter
- ✅ `01-content-overview.md` - 内容总览
- ✅ `02-author-note.md` - 作者导语
- ✅ `03-author-profile.md` - 作者简介

#### 附录部分 · Back Matter
- ✅ `A-acknowledgements.md` - 致谢
- ✅ `B-glossary.md` - 术语表
- ✅ `C-appendix-snapshots.md` - 案例速览
- ✅ `D-references.md` - 参考文献
- ✅ `E-further-reading.md` - 延伸阅读

#### 正文部分 · Main Content

**第一部分 - 认识框架**
- ✅ `part-01-conceptual/00-overview.md`
- ✅ `part-01-conceptual/01-defining-the-field.md`
- ✅ `part-01-conceptual/02-paradigm-evolution.md`

**第二部分 - 理论基础**
- ✅ `part-02-foundations/00-overview.md`
- ✅ `part-02-foundations/03-technology-foundations.md`
- ✅ `part-02-foundations/04-interdisciplinary-roots.md`
- ✅ `part-02-foundations/05-contextual-drivers.md` ⭐ **包含最新修改**

**第三部分 - 方法体系**
- ✅ `part-03-methods/00-overview.md`
- ✅ `part-03-methods/06-agent-construction.md`
- ✅ `part-03-methods/07-simulation-design.md`
- ✅ `part-03-methods/08-analysis-and-evaluation.md`
- ✅ `part-03-methods/09-quality-and-assurance.md`

**第四部分 - 范式对比**
- ✅ `part-04-integration/00-overview.md`
- ✅ `part-04-integration/10-paradigm-comparison.md`
- ✅ `part-04-integration/11-application-positioning.md`
- ✅ `part-04-integration/12-synergy-design.md`
- ✅ `part-04-integration/13-decision-matrix.md`

**第五部分 - 应用实践**
- ✅ `part-05-applications/00-overview.md`
- ✅ `part-05-applications/14-consumer-applications.md`
- ✅ `part-05-applications/15-enterprise-services.md`
- ✅ `part-05-applications/16-scientific-research.md`

**第六部分 - 未来治理**
- ✅ `part-06-futures-governance/00-overview.md`
- ✅ `part-06-futures-governance/17-social-simulation.md`
- ✅ `part-06-futures-governance/18-ethics-and-risks.md`
- ✅ `part-06-futures-governance/19-business-and-society.md`

#### 其他文件
- ✅ `README.md` - 手稿导航

---

## 关键更新 · Key Updates

### 1. 章节标题简化
第二部分的 `05-contextual-drivers.md` 移除了英文副标题：
- ~~`# 5. 时代需求：从效率到体验的必然转型（Contextual Drivers）`~~
- **`# 5. 时代需求：从效率到体验的必然转型`**

类似的修改可能也应用于其他章节。

### 2. MDX 语法修复
所有 MDX 特殊字符（如 `<`）已正确转义，避免编译错误。

---

## 验证结果 · Verification

### 构建测试
```bash
✅ npm run build - 成功
✅ 编译时间: ~2秒
✅ 无错误、无警告
✅ 输出: build/ 目录
```

### 内容完整性
```bash
✅ 文件数量: 44 个
✅ 目录结构: 完整
✅ 特殊字符: 已转义
✅ 链接引用: 待验证
```

---

## 同步命令 · Sync Command

```bash
# 执行的同步命令
rsync -av --delete \
  --exclude='book-structure.md' \
  --exclude='writing-style-guide.md' \
  manuscript/ site/manuscript/
```

**参数说明:**
- `-a`: 归档模式，保留权限和时间戳
- `-v`: 详细输出
- `--delete`: 删除目标目录中源目录没有的文件
- `--exclude`: 排除不需要同步的文件

---

## 后续维护 · Maintenance

### 日常同步流程
```bash
# 1. 在 manuscript/ 中编辑内容
cd /Users/zhangxin/pci/book/manuscript
# 编辑文件...

# 2. 同步到 site
cd /Users/zhangxin/pci/book
rsync -av --delete \
  --exclude='book-structure.md' \
  --exclude='writing-style-guide.md' \
  manuscript/ site/manuscript/

# 3. 测试构建
cd site
npm run build

# 4. 部署
./deploy.sh
```

### 自动化建议
可以创建一个同步脚本 `sync-manuscript.sh`:
```bash
#!/bin/bash
cd "$(dirname "$0")"
rsync -av --delete \
  --exclude='book-structure.md' \
  --exclude='writing-style-guide.md' \
  ../manuscript/ manuscript/
echo "✅ 同步完成！运行 npm run build 测试。"
```

---

## 注意事项 · Notes

### 保留文件
- **`book-structure.md`**: Docusaurus 特有的结构说明
- **`writing-style-guide.md`**: 写作风格指南（site 版本）

这些文件不会被同步覆盖。

### 检查清单
每次同步后检查：
- [ ] 构建成功 (`npm run build`)
- [ ] 本地预览正常 (`npm run serve`)
- [ ] 导航链接正确
- [ ] 图片资源加载
- [ ] 搜索功能正常

---

## 版本信息 · Version Info

- **Docusaurus:** 3.9.1
- **Node.js:** v20.19.5
- **同步工具:** rsync
- **文件传输:** 127KB
- **传输速度:** 11.5MB/s

---

**同步状态:** ✅ 成功完成  
**构建状态:** ✅ 通过验证  
**部署准备:** ✅ 就绪

---

**下一步:** 运行 `./deploy.sh` 部署到生产环境 🚀

