# Git 初始化脚本
# 使用方法：安装 Git 后，在 PowerShell 中运行此脚本

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "学生管理系统 - Git 初始化脚本" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 检查 Git 是否安装
try {
    $gitVersion = git --version
    Write-Host "✓ Git 已安装: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Git 未安装！" -ForegroundColor Red
    Write-Host ""
    Write-Host "请先安装 Git:" -ForegroundColor Yellow
    Write-Host "1. 访问 https://git-scm.com/download/win" -ForegroundColor Yellow
    Write-Host "2. 下载并安装 Git for Windows" -ForegroundColor Yellow
    Write-Host "3. 重启 PowerShell 后再次运行此脚本" -ForegroundColor Yellow
    exit
}

Write-Host ""

# 获取用户输入
$githubUsername = Read-Host "请输入你的 GitHub 用户名"
$githubEmail = Read-Host "请输入你的 GitHub 邮箱"
$repoName = Read-Host "请输入 GitHub 仓库名称（例如: student-management）"

Write-Host ""
Write-Host "配置 Git 用户信息..." -ForegroundColor Yellow
git config --global user.name $githubUsername
git config --global user.email $githubEmail

Write-Host ""
Write-Host "初始化 Git 仓库..." -ForegroundColor Yellow
git init

Write-Host ""
Write-Host "添加文件..." -ForegroundColor Yellow
git add .

Write-Host ""
Write-Host "创建初始提交..." -ForegroundColor Yellow
git commit -m "Initial commit: 学生管理系统 - Streamlit版本"

Write-Host ""
Write-Host "设置远程仓库..." -ForegroundColor Yellow
$repoUrl = "https://github.com/$githubUsername/$repoName.git"
git remote add origin $repoUrl

Write-Host ""
Write-Host "设置主分支..." -ForegroundColor Yellow
git branch -M main

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "准备完成！" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "下一步操作：" -ForegroundColor Yellow
Write-Host "1. 在 GitHub 上创建仓库: $repoName" -ForegroundColor White
Write-Host "2. 访问: https://github.com/new" -ForegroundColor White
Write-Host "3. 创建仓库后，执行以下命令推送代码：" -ForegroundColor White
Write-Host ""
Write-Host "   git push -u origin main" -ForegroundColor Cyan
Write-Host ""
Write-Host "注意：推送时需要输入 GitHub 用户名和 Personal Access Token" -ForegroundColor Yellow
Write-Host "生成 Token: https://github.com/settings/tokens" -ForegroundColor Yellow
Write-Host ""

