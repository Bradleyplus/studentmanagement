# 学生管理系统 - 一键部署脚本
# 使用方法：在 PowerShell 中运行此脚本

$git = "D:\python\cusor\Git\bin\git.exe"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "学生管理系统 - GitHub + Streamlit 部署" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 检查 Git 配置
Write-Host "检查 Git 配置..." -ForegroundColor Yellow
$userName = & $git config --global user.name
$userEmail = & $git config --global user.email
Write-Host "用户名: $userName" -ForegroundColor Gray
Write-Host "邮箱: $userEmail" -ForegroundColor Gray
Write-Host ""

# 获取 GitHub 信息
Write-Host "请输入 GitHub 信息：" -ForegroundColor Yellow
$githubUsername = Read-Host "GitHub 用户名（当前: $userName）"
if ([string]::IsNullOrWhiteSpace($githubUsername)) {
    $githubUsername = $userName
}

$repoName = Read-Host "GitHub 仓库名称（例如: student-management）"

# 添加远程仓库
Write-Host ""
Write-Host "配置远程仓库..." -ForegroundColor Yellow
$repoUrl = "https://github.com/$githubUsername/$repoName.git"

# 检查是否已有远程仓库
$existingRemote = & $git remote get-url origin 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "远程仓库已存在: $existingRemote" -ForegroundColor Gray
    $change = Read-Host "是否更改？(y/n)"
    if ($change -eq "y") {
        & $git remote remove origin
        & $git remote add origin $repoUrl
        Write-Host "✓ 远程仓库已更新" -ForegroundColor Green
    }
} else {
    & $git remote add origin $repoUrl
    Write-Host "✓ 远程仓库已添加" -ForegroundColor Green
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "✓ 本地配置完成！" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "📋 接下来的步骤：" -ForegroundColor Yellow
Write-Host ""
Write-Host "1️⃣  在 GitHub 上创建仓库" -ForegroundColor White
Write-Host "   👉 https://github.com/new" -ForegroundColor Cyan
Write-Host "   📝 仓库名: $repoName" -ForegroundColor Gray
Write-Host "   ⚠️  不要勾选 'Initialize with README'" -ForegroundColor Yellow
Write-Host ""
Write-Host "2️⃣  生成 Personal Access Token" -ForegroundColor White
Write-Host "   👉 https://github.com/settings/tokens" -ForegroundColor Cyan
Write-Host "   📝 点击 'Generate new token (classic)'" -ForegroundColor Gray
Write-Host "   📝 勾选 'repo' 权限" -ForegroundColor Gray
Write-Host "   ⚠️  复制 Token（只显示一次！）" -ForegroundColor Yellow
Write-Host ""
Write-Host "3️⃣  推送代码到 GitHub" -ForegroundColor White
Write-Host "   执行以下命令：" -ForegroundColor Gray
Write-Host ""
Write-Host "   & `"D:\python\cusor\Git\bin\git.exe`" push -u origin main" -ForegroundColor Cyan
Write-Host ""
Write-Host "   👤 用户名: $githubUsername" -ForegroundColor Gray
Write-Host "   🔑 密码: 输入刚才生成的 Token" -ForegroundColor Gray
Write-Host ""
Write-Host "4️⃣  部署到 Streamlit Cloud" -ForegroundColor White
Write-Host "   👉 https://streamlit.io/cloud" -ForegroundColor Cyan
Write-Host "   📝 使用 GitHub 登录" -ForegroundColor Gray
Write-Host "   📝 点击 'New app'" -ForegroundColor Gray
Write-Host "   📝 选择仓库: $repoName" -ForegroundColor Gray
Write-Host "   📝 Main file: streamlit_app.py" -ForegroundColor Gray
Write-Host "   📝 Python version: 3.11" -ForegroundColor Gray
Write-Host "   📝 点击 'Deploy'" -ForegroundColor Gray
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
$pushNow = Read-Host "是否现在推送代码？(y/n)"
if ($pushNow -eq "y") {
    Write-Host ""
    Write-Host "正在推送..." -ForegroundColor Yellow
    & $git push -u origin main
    Write-Host ""
    Write-Host "✓ 推送完成！" -ForegroundColor Green
    Write-Host ""
    Write-Host "如果推送失败，请确保：" -ForegroundColor Yellow
    Write-Host "1. 已在 GitHub 上创建仓库" -ForegroundColor Gray
    Write-Host "2. 已生成 Personal Access Token" -ForegroundColor Gray
    Write-Host "3. 使用 Token 作为密码" -ForegroundColor Gray
} else {
    Write-Host ""
    Write-Host "稍后可以手动执行推送命令" -ForegroundColor Gray
}

Write-Host ""
Read-Host "按 Enter 退出"

