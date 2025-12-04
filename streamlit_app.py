import streamlit as st
import sqlite3
from datetime import datetime
import pandas as pd

# 页面配置
st.set_page_config(
    page_title="学生管理系统",
    page_icon="👨‍🎓",
    layout="wide",
    initial_sidebar_state="expanded"
)

# 初始化数据库
def init_db():
    conn = sqlite3.connect('students.db', check_same_thread=False)
    c = conn.cursor()
    c.execute('''
        CREATE TABLE IF NOT EXISTS students (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            student_id TEXT UNIQUE NOT NULL,
            name TEXT NOT NULL,
            gender TEXT NOT NULL,
            age INTEGER NOT NULL,
            class_name TEXT NOT NULL,
            phone TEXT,
            email TEXT,
            address TEXT,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    ''')
    conn.commit()
    return conn

# 获取数据库连接
@st.cache_resource
def get_db():
    return init_db()

# 初始化数据库
conn = get_db()

# 侧边栏导航
st.sidebar.title("👨‍🎓 学生管理系统")
page = st.sidebar.radio(
    "导航",
    ["学生列表", "添加学生", "搜索学生"],
    index=0
)

# 学生列表页面
if page == "学生列表":
    st.title("📋 学生列表")
    
    # 获取所有学生
    df = pd.read_sql_query("SELECT * FROM students ORDER BY created_at DESC", conn)
    
    if len(df) > 0:
        # 显示统计信息
        col1, col2, col3, col4 = st.columns(4)
        with col1:
            st.metric("总学生数", len(df))
        with col2:
            st.metric("男生", len(df[df['gender'] == '男']))
        with col3:
            st.metric("女生", len(df[df['gender'] == '女']))
        with col4:
            st.metric("班级数", df['class_name'].nunique())
        
        st.divider()
        
        # 显示数据表格
        st.dataframe(
            df[['student_id', 'name', 'gender', 'age', 'class_name', 'phone']],
            use_container_width=True,
            hide_index=True
        )
        
        # 操作按钮
        st.subheader("操作")
        selected_id = st.selectbox("选择要操作的学生", 
                                   options=df['id'].tolist(),
                                   format_func=lambda x: f"{df[df['id']==x]['name'].values[0]} ({df[df['id']==x]['student_id'].values[0]})")
        
        col1, col2 = st.columns(2)
        with col1:
            if st.button("查看详情", type="primary", use_container_width=True):
                st.session_state['view_id'] = selected_id
                st.rerun()
        with col2:
            if st.button("删除学生", type="secondary", use_container_width=True):
                c = conn.cursor()
                c.execute("DELETE FROM students WHERE id = ?", (selected_id,))
                conn.commit()
                st.success("删除成功！")
                st.rerun()
    else:
        st.info("暂无学生信息，请添加学生。")

# 查看详情（在session_state中）
if 'view_id' in st.session_state:
    st.title("👤 学生详情")
    c = conn.cursor()
    c.execute("SELECT * FROM students WHERE id = ?", (st.session_state['view_id'],))
    student = c.fetchone()
    
    if student:
        col1, col2 = st.columns(2)
        with col1:
            st.subheader("基本信息")
            st.write(f"**学号**: {student[1]}")
            st.write(f"**姓名**: {student[2]}")
            st.write(f"**性别**: {student[3]}")
            st.write(f"**年龄**: {student[4]}")
            st.write(f"**班级**: {student[5]}")
        with col2:
            st.subheader("联系方式")
            st.write(f"**电话**: {student[6] or '-'}")
            st.write(f"**邮箱**: {student[7] or '-'}")
            st.write(f"**地址**: {student[8] or '-'}")
            st.write(f"**创建时间**: {student[9]}")
            st.write(f"**更新时间**: {student[10]}")
        
        if st.button("返回列表"):
            del st.session_state['view_id']
            st.rerun()

# 添加学生页面
elif page == "添加学生":
    st.title("➕ 添加学生")
    
    with st.form("add_student_form"):
        col1, col2 = st.columns(2)
        with col1:
            student_id = st.text_input("学号 *", placeholder="请输入学号")
            name = st.text_input("姓名 *", placeholder="请输入姓名")
            gender = st.selectbox("性别 *", ["", "男", "女"])
            age = st.number_input("年龄 *", min_value=1, max_value=150, value=18)
        with col2:
            class_name = st.text_input("班级 *", placeholder="请输入班级")
            phone = st.text_input("电话", placeholder="请输入电话")
            email = st.text_input("邮箱", placeholder="请输入邮箱")
            address = st.text_area("地址", placeholder="请输入地址")
        
        submitted = st.form_submit_button("提交", type="primary", use_container_width=True)
        
        if submitted:
            if not all([student_id, name, gender, class_name]):
                st.error("请填写所有必填项（标有*的字段）")
            elif age <= 0:
                st.error("年龄必须大于0")
            else:
                try:
                    c = conn.cursor()
                    c.execute('''
                        INSERT INTO students 
                        (student_id, name, gender, age, class_name, phone, email, address)
                        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                    ''', (student_id, name, gender, age, class_name, phone or None, email or None, address or None))
                    conn.commit()
                    st.success("学生信息添加成功！")
                    st.balloons()
                    # 清空表单
                    st.rerun()
                except sqlite3.IntegrityError:
                    st.error("学号已存在，请使用不同的学号")
                except Exception as e:
                    st.error(f"添加失败：{str(e)}")

# 搜索学生页面
elif page == "搜索学生":
    st.title("🔍 搜索学生")
    
    search_term = st.text_input("搜索", placeholder="输入学号、姓名或班级进行搜索")
    
    if search_term:
        c = conn.cursor()
        c.execute('''
            SELECT * FROM students 
            WHERE student_id LIKE ? OR name LIKE ? OR class_name LIKE ?
            ORDER BY created_at DESC
        ''', (f'%{search_term}%', f'%{search_term}%', f'%{search_term}%'))
        results = c.fetchall()
        
        if results:
            st.success(f"找到 {len(results)} 条结果")
            df = pd.DataFrame(results, columns=[
                'id', 'student_id', 'name', 'gender', 'age', 
                'class_name', 'phone', 'email', 'address', 'created_at', 'updated_at'
            ])
            st.dataframe(
                df[['student_id', 'name', 'gender', 'age', 'class_name', 'phone']],
                use_container_width=True,
                hide_index=True
            )
        else:
            st.info("未找到匹配的学生")
    else:
        st.info("请输入搜索关键词")

# 页脚统计
st.sidebar.divider()
st.sidebar.markdown("---")
st.sidebar.markdown("### 📊 数据统计")
try:
    stats_df = pd.read_sql_query("SELECT * FROM students", conn)
    if len(stats_df) > 0:
        st.sidebar.metric("总学生数", len(stats_df))
        st.sidebar.metric("平均年龄", f"{stats_df['age'].mean():.1f}岁")
    else:
        st.sidebar.info("暂无数据")
except:
    st.sidebar.info("暂无数据")

