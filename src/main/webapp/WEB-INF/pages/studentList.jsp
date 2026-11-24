<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生管理</title>
    <style>
        * {margin: 0; padding: 0; box-sizing: border-box;}
        body {
            font-family: "Microsoft Yahei", sans-serif;
            background: #f5f7fa;
            padding: 25px;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background: #fff;
            border-radius: 8px;
            padding: 25px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.06);
        }
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #ebeef5;
        }
        .page-title {
            font-size: 20px;
            color: #303133;
            font-weight: 500;
        }
        .toolbar a {
            display: inline-block;
            padding: 7px 16px;
            margin-left: 8px;
            border-radius: 4px;
            text-decoration: none;
            font-size: 14px;
            transition: all 0.3s;
        }
        .btn-primary {
            background: #409eff;
            color: #fff;
        }
        .btn-primary:hover {
            background: #66b1ff;
        }
        .btn-plain {
            border: 1px solid #dcdfe6;
            color: #606266;
        }
        .btn-plain:hover {
            border-color: #409eff;
            color: #409eff;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 12px 10px;
            text-align: center;
            border-bottom: 1px solid #ebeef5;
            font-size: 14px;
            color: #606266;
        }
        th {
            background: #fafafa;
            color: #909399;
            font-weight: 500;
        }
        tbody tr:hover {
            background: #f5f7fa;
        }
        .opt a {
            color: #409eff;
            text-decoration: none;
            margin: 0 6px;
            font-size: 14px;
        }
        .opt a:hover {
            text-decoration: underline;
        }
        .opt a.danger {
            color: #f56c6c;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="page-header">
        <div class="page-title">学生信息管理</div>
        <div class="toolbar">
            <a href="${pageContext.request.contextPath}/student/toAdd" class="btn-primary">新增学生</a>
            <a href="${pageContext.request.contextPath}/admin/toIndex" class="btn-plain">返回首页</a>
        </div>
    </div>

    <table>
        <thead>
        <tr>
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>班级</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${stuList}" var="stu">
            <tr>
                <td>${stu.id}</td>
                <td>${stu.stuName}</td>
                <td>${stu.gender}</td>
                <td>${stu.age}</td>
                <td>${stu.stuClass}</td>
                <td class="opt">
                    <a href="${pageContext.request.contextPath}/score/list?stuId=${stu.id}">查看成绩</a>
                    <a href="${pageContext.request.contextPath}/student/toEdit?id=${stu.id}">编辑</a>
                    <a href="${pageContext.request.contextPath}/student/delete?id=${stu.id}" class="danger" onclick="return confirm('确定删除该学生？')">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>