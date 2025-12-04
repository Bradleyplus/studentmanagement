# 学生管理系统

基于 Flask 开发的 Web 学生管理系统，提供学生信息的增删改查功能。

## 功能特性

- ✅ 学生信息管理（增删改查）
- ✅ 学生列表展示（分页）
- ✅ 搜索功能（支持学号、姓名、班级搜索）
- ✅ 响应式设计（支持移动端）
- ✅ 美观的 Bootstrap UI 界面

## 技术栈

- **后端框架**: Flask 3.0.0
- **数据库**: SQLite + SQLAlchemy ORM
- **前端**: Bootstrap 5.3.0 + Bootstrap Icons
- **Python版本**: 3.7+

## 项目结构

```
.
├── app.py                 # Flask 主应用文件
├── requirements.txt       # Python 依赖包
├── README.md             # 项目说明文档
├── .gitignore           # Git 忽略文件
├── templates/           # HTML 模板目录
│   ├── base.html        # 基础模板
│   ├── index.html       # 学生列表页
│   ├── add.html         # 添加学生页
│   ├── edit.html        # 编辑学生页
│   └── view.html        # 学生详情页
└── students.db          # SQLite 数据库（运行后自动生成）
```

## 安装步骤

### 1. 克隆或下载项目

```bash
# 如果使用 Git
git clone <repository-url>
cd 学生管理系统
```

### 2. 创建虚拟环境（推荐）

**Windows:**
```bash
python -m venv venv
venv\Scripts\activate
```

**Linux/Mac:**
```bash
python3 -m venv venv
source venv/bin/activate
```

### 3. 安装依赖

```bash
pip install -r requirements.txt
```

### 4. 运行应用

```bash
python app.py
```

### 5. 访问应用

打开浏览器访问：`http://localhost:5000`

## 使用说明

### 添加学生
1. 点击导航栏的"添加学生"或首页的"添加新学生"按钮
2. 填写学生信息（带 * 号的为必填项）
3. 点击"提交"按钮

### 查看学生列表
- 首页显示所有学生信息
- 支持分页浏览（每页10条）
- 可通过搜索框搜索学号、姓名或班级

### 编辑学生
1. 在学生列表中点击"编辑"按钮（黄色铅笔图标）
2. 修改学生信息
3. 点击"更新"按钮保存

### 查看详情
- 点击学生列表中的"查看"按钮（蓝色眼睛图标）
- 查看学生的完整信息

### 删除学生
1. 在学生列表中点击"删除"按钮（红色垃圾桶图标）
2. 确认删除操作

## 数据库字段说明

| 字段 | 类型 | 说明 | 必填 |
|------|------|------|------|
| id | Integer | 主键，自增 | 是 |
| student_id | String(20) | 学号，唯一 | 是 |
| name | String(50) | 姓名 | 是 |
| gender | String(10) | 性别 | 是 |
| age | Integer | 年龄 | 是 |
| class_name | String(50) | 班级 | 是 |
| phone | String(20) | 电话 | 否 |
| email | String(100) | 邮箱 | 否 |
| address | String(200) | 地址 | 否 |
| created_at | DateTime | 创建时间 | 自动 |
| updated_at | DateTime | 更新时间 | 自动 |

## 配置说明

### 修改数据库

在 `app.py` 中修改数据库连接：

```python
# SQLite（默认）
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///students.db'

# MySQL 示例
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://user:password@localhost/students'

# PostgreSQL 示例
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://user:password@localhost/students'
```

### 修改密钥

生产环境请修改 `SECRET_KEY`：

```python
app.config['SECRET_KEY'] = 'your-secret-key-here-change-in-production'
```

## 开发建议

### 扩展功能
- 添加用户登录认证
- 添加数据导出功能（Excel/CSV）
- 添加统计图表
- 添加批量导入功能
- 添加照片上传功能

### 性能优化
- 使用 PostgreSQL 替代 SQLite（生产环境）
- 添加 Redis 缓存
- 优化数据库查询

## 常见问题

### Q: 数据库文件在哪里？
A: 首次运行后会在项目根目录生成 `students.db` 文件。

### Q: 如何重置数据库？
A: 删除 `students.db` 文件，重新运行应用即可。

### Q: 端口被占用怎么办？
A: 在 `app.py` 最后一行修改端口号：
```python
app.run(debug=True, host='0.0.0.0', port=8080)  # 改为其他端口
```

## 许可证

MIT License

## 作者

学生管理系统开发团队

---

如有问题或建议，欢迎提交 Issue 或 Pull Request！

