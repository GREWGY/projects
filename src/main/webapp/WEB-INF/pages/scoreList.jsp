<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>成绩管理</title>
    <style>
        * {margin: 0; padding: 0; box-sizing: border-box;}
        body {
            font-family: "Microsoft Yahei", sans-serif;
            background: #f5f7fa;
            padding: 25px;
        }
        .container {
            max-width: 1200px;
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
        .success-tip {
            padding: 10px 15px;
            background: #f0f9eb;
            color: #67c23a;
            border: 1px solid #e1f3d8;
            border-radius: 4px;
            margin-bottom: 18px;
            font-size: 14px;
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
        <div class="page-title">学生成绩管理</div>
        <div class="toolbar">
            <a href="${pageContext.request.contextPath}/score/toAdd?stuId=${stuId}" class="btn-primary">新增成绩</a>
            <a href="${pageContext.request.contextPath}/admin/toIndex" class="btn-plain">返回首页</a>
        </div>
    </div>

    <c:if test="${not empty msg}">
        <div class="success-tip">${msg}</div>
    </c:if>

    <table>
        <thead>
        <tr>
            <th>学号</th>
            <th>学生姓名</th>
            <th>班级</th>
            <th>成绩ID</th>
            <th>课程名称</th>
            <th>分数</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${scoreList}" var="score">
            <tr>
                <td>${score.stuId}</td>
                <td>${score.stuName}</td>
                <td>${score.stuClass}</td>
                <td>${score.id}</td>
                <td>${score.course}</td>
                <td>${score.score}</td>
                <td class="opt">
                    <a href="${pageContext.request.contextPath}/score/toEdit?id=${score.id}&stuId=${score.stuId}">编辑</a>
                    <a href="${pageContext.request.contextPath}/score/delete?id=${score.id}&stuId=${score.stuId}" class="danger" onclick="return confirm('确定删除该成绩？')">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>