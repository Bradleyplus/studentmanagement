# Git 安装指南（Windows）

## 🚀 方法一：官方安装程序（推荐）

### 步骤 1: 下载 Git

1. **访问官方网站**
   - 打开浏览器，访问：https://git-scm.com/download/win
   - 或者直接访问：https://github.com/git-for-windows/git/releases

2. **下载安装程序**
   - 网站会自动检测你的系统（64位或32位）
   - 点击下载按钮，下载 `.exe` 文件
   - 文件名类似：`Git-2.42.0-64-bit.exe`

### 步骤 2: 安装 Git

1. **运行安装程序**
   - 双击下载的 `.exe` 文件
   - 如果出现安全提示，点击"运行"

2. **安装选项（使用默认设置即可）**
   - **许可协议**：点击 "Next"
   - **选择安装位置**：默认即可，点击 "Next"
   - **选择组件**：保持默认勾选，点击 "Next"
   - **选择默认编辑器**：推荐选择 "Use Visual Studio Code" 或 "Nano"，点击 "Next"
   - **调整 PATH 环境**：选择 "Git from the command line and also from 3rd-party software"（推荐），点击 "Next"
   - **选择 HTTPS 传输后端**：选择 "Use the OpenSSL library"（默认），点击 "Next"
   - **配置行尾转换**：选择 "Checkout Windows-style, commit Unix-style line endings"（默认），点击 "Next"
   - **配置终端模拟器**：选择 "Use MinTTY"（默认），点击 "Next"
   - **配置额外选项**：保持默认，点击 "Next"
   - **配置实验性选项**：保持默认，点击 "Install"

3. **等待安装完成**
   - 安装过程可能需要几分钟
   - 安装完成后，点击 "Finish"

### 步骤 3: 验证安装

1. **重启 PowerShell 或命令提示符**
   - 关闭当前窗口
   - 重新打开 PowerShell

2. **测试 Git**
   ```powershell
   git --version
   ```
   
   如果显示版本号（如 `git version 2.42.0`），说明安装成功！✅

---

## 🎯 方法二：使用包管理器

### 使用 Chocolatey（如果已安装）

```powershell
# 以管理员身份运行 PowerShell
choco install git
```

### 使用 Winget（Windows 10/11 自带）

```powershell
winget install --id Git.Git -e --source winget
```

---

## ⚙️ 首次配置 Git

安装完成后，需要配置你的身份信息：

```powershell
# 设置用户名（替换为你的 GitHub 用户名）
git config --global user.name "你的用户名"

# 设置邮箱（替换为你的 GitHub 邮箱）
git config --global user.email "your.email@example.com"

# 查看配置
git config --list
```

---

## 🔍 验证安装

运行以下命令验证 Git 是否正常工作：

```powershell
# 查看版本
git --version

# 查看配置
git config --global --list

# 查看帮助
git help
```

---

## 📝 安装后下一步

安装 Git 后，你可以：

1. **初始化项目并推送到 GitHub**
   - 参考 `GIT_SETUP.md` 文件
   - 或运行 `setup_git.ps1` 脚本

2. **部署 Streamlit 应用**
   - 参考 `STREAMLIT_DEPLOY.md` 文件

---

## 🆘 常见问题

### Q: 安装后 PowerShell 仍然提示找不到 git？

**解决方法**：
1. 关闭所有 PowerShell 窗口
2. 重新打开 PowerShell
3. 如果还是不行，重启电脑

### Q: 如何更新 Git？

**方法一**：重新下载最新版本安装程序
**方法二**：使用包管理器更新
```powershell
# Chocolatey
choco upgrade git

# Winget
winget upgrade Git.Git
```

### Q: 安装时选择什么选项？

**推荐设置**：
- ✅ 使用默认编辑器（VS Code 或 Nano）
- ✅ Git from the command line（添加到 PATH）
- ✅ Use OpenSSL library
- ✅ Checkout Windows-style, commit Unix-style line endings
- ✅ Use MinTTY

---

## 📚 学习资源

- **Git 官方文档**：https://git-scm.com/doc
- **GitHub 学习指南**：https://docs.github.com/zh/get-started
- **Git 可视化教程**：https://learngitbranching.js.org/

---

安装完成后，告诉我，我可以帮你继续初始化项目！🚀

