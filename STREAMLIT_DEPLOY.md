# Streamlit Cloud 部署指南

## 🚀 快速部署（3步搞定）

### 步骤 1: 准备 GitHub 仓库

如果还没有 Git 仓库，执行以下命令：

```bash
# 初始化 Git
git init

# 添加文件（确保包含 streamlit_app.py）
git add .

# 提交
git commit -m "学生管理系统 - Streamlit版本"

# 在 GitHub 上创建新仓库，然后连接
git remote add origin https://github.com/你的用户名/仓库名.git
git branch -M main
git push -u origin main
```

### 步骤 2: 部署到 Streamlit Cloud

1. **访问 Streamlit Cloud**
   - 打开 https://streamlit.io/cloud
   - 或直接访问 https://share.streamlit.io

2. **登录**
   - 点击 "Sign up" 或 "Sign in"
   - 使用你的 **GitHub 账号**登录（必须）

3. **创建新应用**
   - 点击右上角的 "New app" 按钮
   - 或访问 https://share.streamlit.io/deploy

4. **配置应用**
   - **Repository**: 选择你的 GitHub 仓库
   - **Branch**: 选择 `main`（或 `master`）
   - **Main file path**: 输入 `streamlit_app.py`
   - **Python version**: 选择 `3.11`（推荐）

5. **部署**
   - 点击 "Deploy" 按钮
   - 等待部署完成（通常 1-2 分钟）

### 步骤 3: 完成！

部署成功后，你会获得一个网址，例如：
```
https://你的应用名.streamlit.app
```

---

## 📋 部署前检查清单

确保以下文件已提交到 GitHub：

- ✅ `streamlit_app.py` - 主应用文件
- ✅ `requirements_streamlit.txt` - 依赖文件
- ✅ `.gitignore` - Git 忽略配置（可选）
- ✅ `README.md` - 项目说明（可选）

**注意**：不要提交 `students.db` 数据库文件（已在 .gitignore 中）

---

## 🔧 配置说明

### 依赖文件

Streamlit Cloud 会自动读取 `requirements_streamlit.txt`，如果文件不存在，会尝试读取 `requirements.txt`。

当前 `requirements_streamlit.txt` 内容：
```
streamlit>=1.28.0
pandas>=2.2.0
```

### Python 版本

推荐使用 Python 3.11，兼容性最好。

---

## 🔄 更新应用

每次你推送代码到 GitHub 的 `main` 分支，Streamlit Cloud 会自动重新部署应用。

```bash
git add .
git commit -m "更新功能"
git push
```

---

## ⚙️ 高级配置

### 环境变量

如果需要配置环境变量：

1. 在 Streamlit Cloud 应用页面
2. 点击 "Settings"（设置）
3. 找到 "Secrets" 部分
4. 添加环境变量

### 自定义域名

Streamlit Cloud 免费版不支持自定义域名，但你可以：
- 使用 Streamlit 提供的免费子域名
- 升级到付费版获得自定义域名

---

## 🐛 常见问题

### Q: 部署失败怎么办？

**检查清单**：
1. ✅ `streamlit_app.py` 文件名是否正确
2. ✅ `requirements_streamlit.txt` 是否存在
3. ✅ 代码中是否有语法错误
4. ✅ 查看 Streamlit Cloud 的日志（Logs 标签）

### Q: 应用运行但显示错误？

**可能原因**：
- 数据库文件不存在（首次运行会自动创建）
- 依赖包版本不兼容
- 代码逻辑错误

**解决方法**：
- 查看应用日志
- 检查本地运行是否正常
- 更新依赖版本

### Q: 如何查看应用日志？

1. 在 Streamlit Cloud 应用页面
2. 点击 "Logs" 标签
3. 查看实时日志输出

### Q: 数据库数据会丢失吗？

**SQLite 数据库**：
- 数据会持久化保存
- 除非手动删除或重新部署，否则数据不会丢失
- 建议定期备份重要数据

---

## 📊 功能特性

部署后的应用包含以下功能：

- ✅ 学生列表展示（带统计信息）
- ✅ 添加学生
- ✅ 搜索学生（按学号、姓名、班级）
- ✅ 查看学生详情
- ✅ 删除学生
- ✅ 响应式设计（支持移动端）

---

## 🎉 完成！

恭喜！你的学生管理系统已经部署到云端，全世界都可以访问了！

**访问地址示例**：
```
https://student-management-你的用户名.streamlit.app
```

---

## 📞 需要帮助？

- Streamlit Cloud 文档：https://docs.streamlit.io/streamlit-community-cloud
- Streamlit 社区：https://discuss.streamlit.io

