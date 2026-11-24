<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>学生成绩管理系统</title>
    <style>
        a {
            font-size: 32px;
            color: purple;
        }
        h1 {
            font-size: 60px;
        }
    </style>
    <script>
        function goAllScore(){
            // 固定跳转listAll，强制加随机参数
            let url = "${pageContext.request.contextPath}/score/listAll?t=" + new Date().getTime();
            window.location.href = url;
        }
    </script>
</head>
<body>
    <h1>欢迎进入学生成绩管理系统</h1>
    <hr>
    <p><a href="${pageContext.request.contextPath}/student/list">学生信息管理</a></p>
    <%-- 点击触发JS跳转，不再依赖href缓存 --%>
    <p><a href="${pageContext.request.contextPath}/score/listAll">成绩信息管理</a></p>
    <hr>
    <p><a href="${pageContext.request.contextPath}/admin/logout">退出登录</a></p>
</body>
</html>