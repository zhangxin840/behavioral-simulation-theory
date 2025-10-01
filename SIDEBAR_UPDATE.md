# Sidebar 更新记录

**日期:** 2025-10-01  
**文件:** `sidebars.js`  
**状态:** ✅ 完成

---

## 更新内容

将侧边栏标题与 manuscript 实际内容对齐，使用正式的中文标题。

### 修改对照表

| 部分 | 原标题 | 新标题 | 来源文件 |
|------|--------|--------|---------|
| Part 01 | Part 01 · Conceptual Field 概念场域 | **第一部分｜认识框架** | part-01-conceptual/00-overview.md |
| Part 02 | Part 02 · Foundations 方法论根基 | **第二部分｜理论基础与发展动因** | part-02-foundations/00-overview.md |
| Part 03 | Part 03 · Methods 设计作业 | **第三部分｜方法体系与操作框架** | part-03-methods/00-overview.md |
| Part 04 | Part 04 · Integration 体系整合 | **第四部分｜范式对比与协同机制** | part-04-integration/00-overview.md |
| Part 05 | Part 05 · Applications 场景应用 | **第五部分｜应用案例与实践指南** | part-05-applications/00-overview.md |
| Part 06 | Part 06 · Futures & Governance 前瞻治理 | **第六部分｜未来展望与治理框架** | part-06-futures-governance/00-overview.md |

### 保持不变

- ✅ `📘 行为模拟论总览` (README)
- ✅ `Front Matter 前置导引` (符合 book-structure.md 定义)
- ✅ `Back Matter 附录与索引` (符合 book-structure.md 定义)

---

## 更新原因

1. **标题不一致**: 原 sidebar 使用的是英文+中文混合标题，与 manuscript 内实际章节标题不符
2. **术语错误**: 
   - Part 02 原标题"方法论根基"不准确，应为"理论基础与发展动因"
   - Part 03 原标题"设计作业"不准确,应为"方法体系与操作框架"
3. **风格统一**: 新标题使用统一的"第X部分｜标题"格式，更符合中文书籍规范

---

## 验证结果

### 构建测试
```bash
npm run build
```

**结果:** ✅ 成功
- Server: Compiled successfully in 695.71ms
- Client: Compiled successfully in 947.24ms
- 所有静态文件正常生成

### 内容对齐验证
| 部分 | Sidebar 标题 | Overview 文件标题 | 状态 |
|------|-------------|------------------|------|
| Part 01 | 第一部分｜认识框架 | 第一部分｜认识框架 | ✅ 匹配 |
| Part 02 | 第二部分｜理论基础与发展动因 | 第二部分｜理论基础与发展动因 | ✅ 匹配 |
| Part 03 | 第三部分｜方法体系与操作框架 | 第三部分｜方法体系与操作框架 | ✅ 匹配 |
| Part 04 | 第四部分｜范式对比与协同机制 | 第四部分｜范式对比与协同机制 | ✅ 匹配 |
| Part 05 | 第五部分｜应用案例与实践指南 | 第五部分｜应用案例与实践指南 | ✅ 匹配 |
| Part 06 | 第六部分｜未来展望与治理框架 | 第六部分｜未来展望与治理框架 | ✅ 匹配 |

---

## 影响范围

### 用户可见变化
- ✅ 网站左侧导航栏显示更新后的中文标题
- ✅ 标题更清晰、更规范
- ✅ 与书籍内容完全一致

### 技术影响
- ✅ 无破坏性变更
- ✅ 文件路径不变
- ✅ 自动生成逻辑不变
- ✅ 构建流程正常

---

## 后续建议

1. **保持同步**: 今后如果 manuscript 中的 overview 标题有调整，需同步更新 sidebars.js
2. **验证流程**: 每次更新 sidebar 后运行 `npm run build` 验证
3. **文档维护**: 本文件记录了标题的权威来源(各 part 的 00-overview.md)

---

## 相关文件

- **主文件**: `/book/site/sidebars.js`
- **参考来源**:
  - `/book/manuscript/parts/part-01-conceptual/00-overview.md`
  - `/book/manuscript/parts/part-02-foundations/00-overview.md`
  - `/book/manuscript/parts/part-03-methods/00-overview.md`
  - `/book/manuscript/parts/part-04-integration/00-overview.md`
  - `/book/manuscript/parts/part-05-applications/00-overview.md`
  - `/book/manuscript/parts/part-06-futures-governance/00-overview.md`
- **规范文档**: `/book/book-structure.md`

---

**✅ 更新完成！Sidebar 现已与 manuscript 内容完全对齐。**

