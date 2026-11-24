<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>编辑学生</title>
    <style>
        * {margin: 0; padding: 0; box-sizing: border-box;}
        body {
            font-family: "Microsoft Yahei", sans-serif;
            background: #f5f7fa;
            padding: 40px 20px;
        }
        .form-card {
            max-width: 500px;
            margin: 0 auto;
            background: #fff;
            border-radius: 8px;
            padding: 30px 35px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.06);
        }
        .form-title {
            font-size: 20px;
            color: #303133;
            margin-bottom: 25px;
            text-align: center;
            font-weight: 500;
        }
        .form-item {
            margin-bottom: 20px;
        }
        .form-item label {
            display: block;
            color: #606266;
            margin-bottom: 8px;
            font-size: 14px;
        }
        .form-item input,
        .form-item select {
            width: 100%;
            padding: 10px 15px;
            border: 1px solid #dcdfe6;
            border-radius: 6px;
            font-size: 14px;
            outline: none;
            transition: border-color 0.3s;
            background: #fff;
        }
        .form-item input:focus,
        .form-item select:focus {
            border-color: #409eff;
        }
        .form-btns {
            display: flex;
            gap: 12px;
            margin-top: 30px;
        }
        .btn {
            flex: 1;
            padding: 10px 0;
            border-radius: 6px;
            border: none;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
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
            background: #fff;
        }
        .btn-plain:hover {
            border-color: #409eff;
            color: #409eff;
        }
    </style>
</head>
<body>
<div class="form-card">
    <div class="form-title">编辑学生信息</div>
    <form action="${pageContext.request.contextPath}/student/edit" method="post">
        <input type="hidden" name="id" value="${stu.id}">

        <div class="form-item">
            <label>学生姓名</label>
            <input type="text" name="stuName" value="${stu.stuName}" required>
        </div>
        <div class="form-item">
            <label>性别</label>
            <select name="gender" required>
                <option value="男" <c:if test="${stu.gender == '男'}">selected</c:if>>男</option>
                <option value="女" <c:if test="${stu.gender == '女'}">selected</c:if>>女</option>
            </select>
        </div>
        <div class="form-item">
            <label>年龄</label>
            <input type="number" name="age" value="${stu.age}" min="1" max="100" required>
        </div>
        <div class="form-item">
            <label>班级</label>
            <input type="text" name="stuClass" value="${stu.stuClass}" required>
        </div>

        <div class="form-btns">
            <a href="${pageContext.request.contextPath}/student/list" class="btn btn-plain">取消</a>
            <button type="submit" class="btn btn-primary">保 存</button>
        </div>
    </form>
</div>
</body>
</html>