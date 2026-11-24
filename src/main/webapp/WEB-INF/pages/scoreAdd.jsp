<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>新增成绩</title>
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
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .form-item label .add-stu {
            color: #409eff;
            font-size: 12px;
            text-decoration: none;
        }
        .form-item label .add-stu:hover {
            text-decoration: underline;
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
    <div class="form-title">新增成绩信息</div>
    <form action="${pageContext.request.contextPath}/score/add" method="post">

        <div class="form-item">
            <label>
                所属学生
                <a href="${pageContext.request.contextPath}/student/toAdd" target="_blank" class="add-stu">+ 新增学生</a>
            </label>
            <select name="stuId" required>
                <option value="">请选择学生</option>
                <c:forEach items="${studentList}" var="stu">
                    <option value="${stu.id}" <c:if test="${stu.id == stuId}">selected</c:if>>
                            ${stu.stuName} - ${stu.stuClass}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-item">
            <label>课程名称</label>
            <input type="text" name="course" placeholder="请输入课程名称" required>
        </div>
        <div class="form-item">
            <label>分数</label>
            <input type="number" name="score" placeholder="请输入分数" min="0" max="100" required>
        </div>

        <div class="form-btns">
            <c:choose>
                <c:when test="${stuId != null}">
                    <a href="${pageContext.request.contextPath}/score/list?stuId=${stuId}" class="btn btn-plain">取消</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/score/listAll" class="btn btn-plain">取消</a>
                </c:otherwise>
            </c:choose>
            <button type="submit" class="btn btn-primary">保 存</button>
        </div>
    </form>
</div>
</body>
</html>