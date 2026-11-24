<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>系统首页</title>
    <style>
        * {margin: 0; padding: 0; box-sizing: border-box;}
        body {
            font-family: "Microsoft Yahei", sans-serif;
            background: #f5f7fa;
        }
        .header {
            background: #fff;
            height: 60px;
            box-shadow: 0 1px 4px rgba(0,0,0,0.08);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 30px;
        }
        .logo {
            font-size: 18px;
            color: #303133;
            font-weight: 500;
        }
        .user-info {
            font-size: 14px;
            color: #606266;
        }
        .user-info a {
            color: #f56c6c;
            text-decoration: none;
            margin-left: 15px;
        }
        .main {
            max-width: 900px;
            margin: 60px auto;
            padding: 0 20px;
        }
        .welcome {
            text-align: center;
            margin-bottom: 40px;
        }
        .welcome h2 {
            color: #303133;
            margin-bottom: 10px;
            font-weight: 500;
        }
        .welcome p {
            color: #909399;
            font-size: 14px;
        }
        .nav-cards {
            display: flex;
            gap: 30px;
            justify-content: center;
        }
        .nav-card {
            flex: 1;
            max-width: 280px;
            background: #fff;
            border-radius: 8px;
            padding: 40px 20px;
            text-align: center;
            box-shadow: 0 2px 12px rgba(0,0,0,0.06);
            text-decoration: none;
            transition: all 0.3s;
        }
        .nav-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 16px rgba(0,0,0,0.1);
        }
        .nav-card .icon {
            font-size: 40px;
            margin-bottom: 15px;
        }
        .nav-card .title {
            font-size: 18px;
            color: #303133;
            margin-bottom: 8px;
        }
        .nav-card .desc {
            font-size: 13px;
            color: #909399;
        }
    </style>
</head>
<body>
<div class="header">
    <div class="logo">学生成绩管理系统</div>
    <div class="user-info">
        欢迎您，${admin.username}
        <a href="${pageContext.request.contextPath}/admin/logout">退出登录</a>
    </div>
</div>

<div class="main">
    <div class="welcome">
        <h2>欢迎使用学生成绩管理系统</h2>
        <p>请选择下方功能模块进入操作</p>
    </div>

    <div class="nav-cards">
        <a href="${pageContext.request.contextPath}/student/list" class="nav-card">
            <div class="icon">👨‍🎓</div>
            <div class="title">学生管理</div>
            <div class="desc">新增、编辑、删除学生信息</div>
        </a>
        <a href="${pageContext.request.contextPath}/score/listAll" class="nav-card">
            <div class="icon">📝</div>
            <div class="title">成绩管理</div>
            <div class="desc">查看、录入、修改学生成绩</div>
        </a>
    </div>
</div>
</body>
</html>