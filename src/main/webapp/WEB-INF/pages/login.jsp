<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>系统登录</title>
    <style>
        * {margin: 0; padding: 0; box-sizing: border-box;}
        body {
            font-family: "Microsoft Yahei", sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-box {
            width: 400px;
            background: #fff;
            border-radius: 12px;
            padding: 40px 35px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.15);
        }
        .login-title {
            text-align: center;
            font-size: 24px;
            color: #333;
            margin-bottom: 30px;
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
        .form-item input {
            width: 100%;
            padding: 10px 15px;
            border: 1px solid #dcdfe6;
            border-radius: 6px;
            font-size: 14px;
            outline: none;
            transition: border-color 0.3s;
        }
        .form-item input:focus {
            border-color: #409eff;
        }
        .error-msg {
            color: #f56c6c;
            font-size: 13px;
            text-align: center;
            margin-bottom: 15px;
        }
        .login-btn {
            width: 100%;
            padding: 11px 0;
            background: #409eff;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .login-btn:hover {
            background: #66b1ff;
        }
    </style>
</head>
<body>
<div class="login-box">
    <div class="login-title">学生成绩管理系统</div>
    <c:if test="${not empty msg}">
        <div class="error-msg">${msg}</div>
    </c:if>
    <form action="${pageContext.request.contextPath}/admin/login" method="post">
        <div class="form-item">
            <label>账号</label>
            <input type="text" name="username" placeholder="请输入账号" required>
        </div>
        <div class="form-item">
            <label>密码</label>
            <input type="password" name="password" placeholder="请输入密码" required>
        </div>
        <button type="submit" class="login-btn">登 录</button>
    </form>
</div>
</body>
</html>