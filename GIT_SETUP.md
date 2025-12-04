# Git 和 GitHub 设置指南

## 📥 第一步：安装 Git

### Windows 安装方法

1. **下载 Git for Windows**
   - 访问：https://git-scm.com/download/win
   - 或直接下载：https://github.com/git-for-windows/git/releases
   - 下载最新版本的 `.exe` 安装程序

2. **安装 Git**
   - 运行下载的安装程序
   - 使用默认设置即可（一路点击 Next）
   - 安装完成后，**重启 PowerShell 或命令提示符**

3. **验证安装**
   ```bash
   git --version
   ```
   如果显示版本号（如 `git version 2.42.0`），说明安装成功。

---

## 🔐 第二步：配置 Git（首次使用）

```bash
# 设置用户名（替换为你的 GitHub 用户名）
git config --global user.name "你的用户名"

# 设置邮箱（替换为你的 GitHub 邮箱）
git config --global user.email "your.email@example.com"
```

---

## 📦 第三步：初始化项目并推送到 GitHub

### 3.1 在 GitHub 上创建仓库

1. 访问 https://github.com
2. 登录你的账号
3. 点击右上角的 "+" → "New repository"
4. 填写信息：
   - **Repository name**: `student-management`（或你喜欢的名字）
   - **Description**: 学生管理系统
   - **Visibility**: Public（公开）或 Private（私有）
   - **不要**勾选 "Initialize this repository with a README"（我们已经有了）
5. 点击 "Create repository"

### 3.2 在本地初始化 Git

安装 Git 后，在项目目录执行以下命令：

```bash
# 进入项目目录（如果不在的话）
cd "D:\新建文件夹 (2)"

# 初始化 Git 仓库
git init

# 添加所有文件
git add .

# 创建初始提交
git commit -m "Initial commit: 学生管理系统 - Streamlit版本"

# 添加远程仓库（替换为你的仓库地址）
git remote add origin https://github.com/你的用户名/你的仓库名.git

# 推送到 GitHub
git branch -M main
git push -u origin main
```

---

## 🚀 快速命令脚本

安装 Git 后，你可以复制以下命令到 PowerShell 执行（记得替换你的信息）：

```powershell
# 配置 Git（只需执行一次）
git config --global user.name "你的GitHub用户名"
git config --global user.email "你的GitHub邮箱"

# 初始化并推送（在项目目录执行）
cd "D:\新建文件夹 (2)"
git init
git add .
git commit -m "Initial commit: 学生管理系统"
git remote add origin https://github.com/你的用户名/你的仓库名.git
git branch -M main
git push -u origin main
```

---

## 🔑 认证方式

### 方式一：使用 Personal Access Token（推荐）

1. **生成 Token**
   - GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
   - 点击 "Generate new token (classic)"
   - 勾选 `repo` 权限
   - 点击 "Generate token"
   - **复制生成的 token**（只显示一次！）

2. **使用 Token**
   - 推送时，用户名输入你的 GitHub 用户名
   - 密码输入刚才生成的 token（不是 GitHub 密码）

### 方式二：使用 GitHub CLI

```bash
# 安装 GitHub CLI
# 然后登录
gh auth login
```

---

## ✅ 验证推送成功

推送成功后，访问你的 GitHub 仓库页面，应该能看到所有文件。

---

## 📝 后续更新

以后更新代码时，使用以下命令：

```bash
git add .
git commit -m "更新说明"
git push
```

---

## 🆘 遇到问题？

### 问题：推送时要求输入用户名密码
**解决**：使用 Personal Access Token 作为密码

### 问题：提示 "remote origin already exists"
**解决**：
```bash
git remote remove origin
git remote add origin https://github.com/你的用户名/你的仓库名.git
```

### 问题：推送被拒绝
**解决**：确保 GitHub 仓库是空的，或者先拉取：
```bash
git pull origin main --allow-unrelated-histories
git push -u origin main
```

---

安装 Git 后，按照上述步骤操作即可！

