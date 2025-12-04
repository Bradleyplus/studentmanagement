# 部署指南

本指南提供两种部署方案：Streamlit Cloud 和 Flask 云平台部署。

## 方案一：Streamlit Cloud 部署（推荐，最简单）

### 优点
- ✅ 完全免费
- ✅ 部署简单，一键部署
- ✅ 自动更新（GitHub推送后自动部署）
- ✅ 无需配置服务器

### 步骤

#### 1. 准备代码
确保项目包含 `streamlit_app.py` 和 `requirements_streamlit.txt`

#### 2. 推送到 GitHub
```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/你的用户名/你的仓库名.git
git push -u origin main
```

#### 3. 部署到 Streamlit Cloud
1. 访问 [Streamlit Cloud](https://streamlit.io/cloud)
2. 使用 GitHub 账号登录
3. 点击 "New app"
4. 选择你的仓库
5. 配置：
   - **Main file path**: `streamlit_app.py`
   - **Python version**: 3.11
6. 点击 "Deploy"

#### 4. 完成
部署完成后，你会获得一个类似 `https://你的应用名.streamlit.app` 的网址。

---

## 方案二：Flask 应用部署

### 选项 A：Render 部署（推荐）

#### 优点
- ✅ 免费套餐可用
- ✅ 支持 PostgreSQL（免费）
- ✅ 自动部署

#### 步骤

1. **准备代码**
   - 确保有 `requirements.txt`（已包含 gunicorn）
   - 确保有 `Procfile`

2. **推送到 GitHub**

3. **部署到 Render**
   - 访问 [Render](https://render.com)
   - 注册/登录账号
   - 点击 "New" → "Web Service"
   - 连接 GitHub 仓库
   - 配置：
     - **Name**: student-management
     - **Environment**: Python 3
     - **Build Command**: `pip install -r requirements.txt`
     - **Start Command**: `gunicorn app:app`
   - 点击 "Create Web Service"

4. **配置环境变量**（可选）
   - `SECRET_KEY`: 生成一个随机密钥
   - `DATABASE_URL`: 如果使用 PostgreSQL

5. **完成**
   部署完成后会获得一个 `https://你的应用名.onrender.com` 的网址

---

### 选项 B：Railway 部署

#### 优点
- ✅ 免费额度充足
- ✅ 部署快速
- ✅ 支持多种数据库

#### 步骤

1. **准备代码**
   - 确保有 `railway.json`（已创建）
   - 确保有 `requirements.txt`

2. **推送到 GitHub**

3. **部署到 Railway**
   - 访问 [Railway](https://railway.app)
   - 使用 GitHub 登录
   - 点击 "New Project" → "Deploy from GitHub repo"
   - 选择你的仓库
   - Railway 会自动检测并部署

4. **配置**
   - 如果需要，添加 PostgreSQL 数据库
   - 更新 `app.py` 中的数据库连接

5. **完成**
   部署完成后会获得一个 `https://你的应用名.up.railway.app` 的网址

---

## 数据库配置

### SQLite（默认，适合小项目）
- 无需配置，开箱即用
- 数据存储在文件系统中

### PostgreSQL（生产环境推荐）

#### Render 配置
```python
import os
DATABASE_URL = os.environ.get('DATABASE_URL', 'sqlite:///students.db')
# Render 的 DATABASE_URL 格式：postgresql://user:pass@host/dbname
# 需要替换 postgresql:// 为 postgresql+psycopg2://
if DATABASE_URL.startswith('postgresql://'):
    DATABASE_URL = DATABASE_URL.replace('postgresql://', 'postgresql+psycopg2://', 1)
app.config['SQLALCHEMY_DATABASE_URI'] = DATABASE_URL
```

#### 更新 requirements.txt
添加：
```
psycopg2-binary==2.9.9
```

---

## 环境变量配置

### 必需的环境变量
- `SECRET_KEY`: Flask 会话密钥（生产环境必须修改）

### 生成 SECRET_KEY
```python
import secrets
print(secrets.token_hex(32))
```

---

## 本地测试部署配置

### 测试 gunicorn
```bash
pip install gunicorn
gunicorn app:app
```

### 测试 Streamlit
```bash
pip install -r requirements_streamlit.txt
streamlit run streamlit_app.py
```

---

## 常见问题

### Q: Streamlit Cloud 部署失败？
A: 检查：
- `streamlit_app.py` 文件名是否正确
- `requirements_streamlit.txt` 是否存在
- Python 版本是否兼容

### Q: Render/Railway 部署失败？
A: 检查：
- `Procfile` 或 `railway.json` 配置是否正确
- `requirements.txt` 是否包含所有依赖
- 日志查看具体错误信息

### Q: 数据库连接失败？
A: 
- 检查数据库 URL 配置
- 确保数据库服务已启动（如果使用 PostgreSQL）
- 检查环境变量是否正确设置

### Q: 静态文件无法加载？
A: 
- 确保 `templates/` 和 `static/` 目录已提交到 Git
- 检查文件路径是否正确

---

## 推荐方案对比

| 方案 | 难度 | 免费额度 | 数据库 | 推荐度 |
|------|------|----------|--------|--------|
| Streamlit Cloud | ⭐ 简单 | 无限 | SQLite | ⭐⭐⭐⭐⭐ |
| Render | ⭐⭐ 中等 | 750小时/月 | PostgreSQL | ⭐⭐⭐⭐ |
| Railway | ⭐⭐ 中等 | $5/月额度 | PostgreSQL | ⭐⭐⭐⭐ |

**建议**：如果是学习项目，推荐 Streamlit Cloud；如果是生产环境，推荐 Render 或 Railway。

---

## 下一步

部署成功后，记得：
1. 更新 `SECRET_KEY`
2. 配置自定义域名（可选）
3. 设置自动备份（如果使用 SQLite）
4. 监控应用性能

