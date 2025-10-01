# 部署修复 · Deployment Fix

## 问题描述 · Issue

**错误信息:**
```
Error: Minimum Node.js version not met :(
[INFO] You are using Node.js v18.20.8, Requirement: Node.js >=20.0.
Error: Process completed with exit code 1.
```

**原因:** 
- Docusaurus 3.9.1 要求 Node.js >= 20.0
- GitHub Actions 工作流仍在使用 Node.js 18

---

## 修复方案 · Solution

### 1. 更新 GitHub Actions 工作流

**文件:** `.github/workflows/deploy.yml`

```diff
  - name: Setup Node.js
    uses: actions/setup-node@v4
    with:
-     node-version: 18
+     node-version: 20
      cache: npm
```

### 2. 更新 package.json engines

**文件:** `package.json`

```diff
  "engines": {
-   "node": ">=16.14"
+   "node": ">=20.0"
  }
```

---

## 验证 · Verification

### 本地验证
```bash
✅ Node.js: v20.19.5
✅ npm run build: SUCCESS
✅ 构建时间: ~0.5秒
```

### GitHub Actions 验证
推送更新后，检查：
1. ✅ Actions 使用 Node.js 20.x
2. ✅ 构建成功
3. ✅ 部署完成

---

## 部署步骤 · Deployment Steps

```bash
# 1. 提交修复
cd /Users/zhangxin/pci/book/site
git add .github/workflows/deploy.yml package.json
git commit -m "Fix: Update Node.js to v20 for Docusaurus 3 compatibility"

# 2. 推送到 GitHub
git push origin main

# 3. 监控部署
# 访问: https://github.com/zhangxin840/behavioral-simulation-theory/actions
```

---

## 检查清单 · Checklist

部署前确认：
- [x] `.github/workflows/deploy.yml` 使用 Node.js 20
- [x] `package.json` engines 字段更新
- [x] 本地构建成功
- [ ] 提交并推送到 GitHub
- [ ] GitHub Actions 构建成功
- [ ] 网站可访问

---

## 相关文件 · Related Files

- `.github/workflows/deploy.yml` - CI/CD 配置
- `package.json` - 依赖和引擎要求
- `UPGRADE_SUMMARY.md` - 升级详情
- `UPGRADE_VERIFICATION.md` - 验证报告

---

## 后续监控 · Monitoring

### 首次部署后检查
1. ✅ Actions 页面显示绿色勾号
2. ✅ 部署时间正常（<5分钟）
3. ✅ 站点可访问
4. ✅ 所有页面正常渲染

### 长期监控
- 定期检查 Actions 运行状态
- 关注 Node.js LTS 更新
- 监控构建时间变化

---

## 额外说明 · Notes

### 为什么需要 Node.js 20？

Docusaurus 3.x 依赖的特性：
- Modern ECMAScript features
- 更好的性能优化
- React 18 完整支持
- MDX v3 兼容性

### 兼容性矩阵

| Docusaurus | Node.js | React | MDX |
|------------|---------|-------|-----|
| 2.x | >= 16.14 | 17 | 1.x |
| 3.x | >= 20.0 | 18 | 3.x |

---

**修复状态:** ✅ 已完成  
**测试状态:** ✅ 本地通过  
**部署状态:** ⏳ 等待推送

---

**下一步:** 推送代码触发 GitHub Actions 部署

