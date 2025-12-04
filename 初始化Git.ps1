# 学生管理系统 - Git 初始化脚本
# 使用方法：右键点击此文件，选择"使用 PowerShell 运行"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "学生管理系统 - Git 初始化" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 检查 Git
Write-Host "检查 Git 安装..." -ForegroundColor Yellow
try {
    $gitVersion = git --version 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ Git 已安装: $gitVersion" -ForegroundColor Green
    } else {
        throw "Git 未找到"
    }
} catch {
    Write-Host "✗ Git 未安装或未添加到 PATH！" -ForegroundColor Red
    Write-Host ""
    Write-Host "请确保：" -ForegroundColor Yellow
    Write-Host "1. 已安装 Git" -ForegroundColor White
    Write-Host "2. 已重启 PowerShell" -ForegroundColor White
    Write-Host "3. 安装时勾选了 'Add Git to PATH' 选项" -ForegroundColor White
    Write-Host ""
    Read-Host "按 Enter 退出"
    exit
}

Write-Host ""

# 检查是否已初始化
if (Test-Path ".git") {
    Write-Host "⚠ Git 仓库已存在" -ForegroundColor Yellow
    $continue = Read-Host "是否继续？(y/n)"
    if ($continue -ne "y") {
        exit
    }
}

# 获取用户信息
Write-Host "请输入 GitHub 信息：" -ForegroundColor Yellow
$githubUsername = Read-Host "GitHub 用户名"
$githubEmail = Read-Host "GitHub 邮箱"
$repoName = Read-Host "GitHub 仓库名称（例如: student-management）"

Write-Host ""
Write-Host "配置 Git 用户信息..." -ForegroundColor Yellow
git config --global user.name $githubUsername
git config --global user.email $githubEmail

Write-Host ""
Write-Host "初始化 Git 仓库..." -ForegroundColor Yellow
if (-not (Test-Path ".git")) {
    git init
} else {
    Write-Host "仓库已存在，跳过初始化" -ForegroundColor Gray
}

Write-Host ""
Write-Host "添加文件..." -ForegroundColor Yellow
git add .

Write-Host ""
Write-Host "创建初始提交..." -ForegroundColor Yellow
git commit -m "Initial commit: 学生管理系统 - Streamlit版本"

Write-Host ""
Write-Host "设置远程仓库..." -ForegroundColor Yellow
$repoUrl = "https://github.com/$githubUsername/$repoName.git"

# 检查远程仓库是否已存在
$existingRemote = git remote get-url origin 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "远程仓库已存在: $existingRemote" -ForegroundColor Gray
    $change = Read-Host "是否更改远程仓库地址？(y/n)"
    if ($change -eq "y") {
        git remote remove origin
        git remote add origin $repoUrl
    }
} else {
    git remote add origin $repoUrl
}

Write-Host ""
Write-Host "设置主分支..." -ForegroundColor Yellow
git branch -M main

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "✓ 初始化完成！" -ForegroundColor Green
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
Write-Host "   git push -u origin main" -ForegroundColor Cyan
Write-Host ""
Write-Host "   用户名: $githubUsername" -ForegroundColor Gray
Write-Host "   密码: 输入刚才生成的 Token" -ForegroundColor Gray
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Read-Host "按 Enter 退出"

