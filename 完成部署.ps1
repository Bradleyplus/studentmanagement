# 完成 GitHub 和 Streamlit Cloud 部署脚本
# 使用方法：在 PowerShell 中运行此脚本

$gitPath = "D:\python\cusor\Git\bin\git.exe"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "学生管理系统 - 部署到 GitHub 和 Streamlit" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 步骤 1: 配置 Git 用户信息
Write-Host "步骤 1: 配置 Git 用户信息" -ForegroundColor Yellow
Write-Host ""

$githubUsername = Read-Host "请输入你的 GitHub 用户名"
$githubEmail = Read-Host "请输入你的 GitHub 邮箱"

& $gitPath config --global user.name $githubUsername
& $gitPath config --global user.email $githubEmail

Write-Host "✓ Git 用户信息已配置" -ForegroundColor Green
Write-Host ""

# 步骤 2: 创建提交
Write-Host "步骤 2: 创建 Git 提交..." -ForegroundColor Yellow
& $gitPath commit -m "Initial commit: 学生管理系统 - Streamlit版本"
& $gitPath branch -M main

Write-Host "✓ 提交已创建" -ForegroundColor Green
Write-Host ""

# 步骤 3: 添加远程仓库
Write-Host "步骤 3: 配置 GitHub 远程仓库" -ForegroundColor Yellow
Write-Host ""

$repoName = Read-Host "请输入 GitHub 仓库名称（例如: student-management）"
$repoUrl = "https://github.com/$githubUsername/$repoName.git"

# 检查是否已有远程仓库
$existingRemote = & $gitPath remote get-url origin 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "远程仓库已存在，正在更新..." -ForegroundColor Gray
    & $gitPath remote remove origin
}
& $gitPath remote add origin $repoUrl

Write-Host "✓ 远程仓库已配置: $repoUrl" -ForegroundColor Green
Write-Host ""

# 步骤 4: 显示后续步骤
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "✓ 本地 Git 配置完成！" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "下一步操作：" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. 在 GitHub 上创建仓库" -ForegroundColor White
Write-Host "   访问: https://github.com/new" -ForegroundColor Gray
Write-Host "   仓库名: $repoName" -ForegroundColor Gray
Write-Host "   不要勾选 'Initialize with README'" -ForegroundColor Gray
Write-Host ""
Write-Host "2. 生成 Personal Access Token" -ForegroundColor White
Write-Host "   访问: https://github.com/settings/tokens" -ForegroundColor Gray
Write-Host "   点击 'Generate new token (classic)'" -ForegroundColor Gray
Write-Host "   勾选 'repo' 权限" -ForegroundColor Gray
Write-Host "   复制生成的 Token（只显示一次！）" -ForegroundColor Gray
Write-Host ""
Write-Host "3. 推送代码到 GitHub" -ForegroundColor White
Write-Host "   执行以下命令：" -ForegroundColor Gray
Write-Host ""
Write-Host "   & `"D:\python\cusor\Git\bin\git.exe`" push -u origin main" -ForegroundColor Cyan
Write-Host ""
Write-Host "   用户名: $githubUsername" -ForegroundColor Gray
Write-Host "   密码: 输入刚才生成的 Token" -ForegroundColor Gray
Write-Host ""
Write-Host "4. 部署到 Streamlit Cloud" -ForegroundColor White
Write-Host "   访问: https://streamlit.io/cloud" -ForegroundColor Gray
Write-Host "   使用 GitHub 登录" -ForegroundColor Gray
Write-Host "   点击 'New app'" -ForegroundColor Gray
Write-Host "   选择仓库: $repoName" -ForegroundColor Gray
Write-Host "   Main file: streamlit_app.py" -ForegroundColor Gray
Write-Host "   Python version: 3.11" -ForegroundColor Gray
Write-Host "   点击 'Deploy'" -ForegroundColor Gray
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Read-Host "按 Enter 退出"

