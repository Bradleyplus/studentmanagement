# 快速部署指南

## 🚀 Streamlit Cloud 部署（5分钟搞定）

### 步骤 1: 推送到 GitHub

```bash
# 初始化 Git（如果还没有）
git init

# 添加所有文件
git add .

# 提交
git commit -m "学生管理系统 - 准备部署"

# 连接到 GitHub（替换为你的仓库地址）
git remote add origin https://github.com/你的用户名/你的仓库名.git

# 推送到 GitHub
git branch -M main
git push -u origin main
```

### 步骤 2: 部署到 Streamlit Cloud

1. 访问 https://streamlit.io/cloud
2. 点击 "Sign up" 使用 GitHub 账号登录
3. 点击 "New app"
4. 选择你的 GitHub 仓库
5. 配置：
   - **Main file path**: `streamlit_app.py`
   - **Python version**: 3.11
6. 点击 "Deploy" 🎉

### 步骤 3: 完成！

部署完成后，你会得到一个网址，例如：
`https://你的应用名.streamlit.app`

---

## 📦 项目文件说明

### Streamlit 版本
- `streamlit_app.py` - Streamlit 应用主文件
- `requirements_streamlit.txt` - Streamlit 依赖

### Flask 版本
- `app.py` - Flask 应用主文件
- `requirements.txt` - Flask 依赖（包含 gunicorn）
- `templates/` - HTML 模板目录

### 部署配置
- `Procfile` - Render/Heroku 部署配置
- `railway.json` - Railway 部署配置
- `render.yaml` - Render 部署配置
- `runtime.txt` - Python 版本配置

---

## 🔧 本地测试

### 测试 Streamlit 版本
```bash
pip install -r requirements_streamlit.txt
streamlit run streamlit_app.py
```

### 测试 Flask 版本
```bash
pip install -r requirements.txt
python app.py
```

---

## 📝 注意事项

1. **数据库**: Streamlit Cloud 使用 SQLite，数据会持久化
2. **免费额度**: Streamlit Cloud 完全免费
3. **自动更新**: 每次推送到 GitHub 主分支，应用会自动更新
4. **环境变量**: 如需配置环境变量，在 Streamlit Cloud 设置中添加

---

## 🆘 遇到问题？

查看 `DEPLOY.md` 获取详细部署说明和故障排除指南。

