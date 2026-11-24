# 学生成绩管理系统（SSM）

基于 SSM（Spring + SpringMVC + MyBatis）的学生成绩管理系统，支持管理员登录、学生信息管理和成绩管理。

## 功能模块

- **管理员登录**：账号密码登录 / 注销（`/admin`）
- **学生管理**：学生信息的增删改查（`/student`）
- **成绩管理**：按学生查询、全部成绩列表、成绩的增删改（`/score`）

## 技术栈

| 类别 | 技术 | 版本 |
| --- | --- | --- |
| 语言 | Java | 8 |
| 构建 | Maven（war 包） | - |
| IoC / MVC | Spring / SpringMVC | 5.3.20 |
| ORM | MyBatis + mybatis-spring | 3.5.9 / 2.0.7 |
| 数据库 | MySQL | 8.0.28 |
| 连接池 | Druid | 1.2.16 |
| 视图 | JSP + JSTL | 1.2 |
| 其他 | Lombok | 1.18.24 |

配置类已实现 `WebApplicationInitializer`，无需 web.xml，可直接部署到 Servlet 3.0+ 容器（如 Tomcat 8/9）。

## 项目结构

```
src/main/java/com/manage/
├── config/       # 配置类（SpringConfig、SpringMvcConfig、WebConfig）
├── controller/   # 控制器（AdminController、StudentController、ScoreController）
├── service/      # 业务层
├── mapper/       # MyBatis Mapper 接口
├── entity/       # 实体类（Admin、Student、Score）
└── util/         # 工具类

src/main/resources/
├── db.properties         # 数据库配置（不入 git）
├── myBatis-config.xml    # MyBatis 全局配置
└── mapper/               # Mapper XML 映射文件

src/main/webapp/WEB-INF/pages/   # JSP 页面
```

## 快速开始

### 1. 环境要求

- JDK 8+
- Maven 3.x
- MySQL 8.x
- Tomcat 8/9（Servlet 3.0+）

### 2. 数据库准备

创建数据库 `score_manage_db`（utf8mb4 编码），并导入表结构和初始数据（admin、student、score 表）。

### 3. 配置数据库连接

```bash
cp db.properties.example src/main/resources/db.properties
```

然后编辑 `src/main/resources/db.properties`，按需修改连接地址和用户名。数据库密码支持两种方式：

- **环境变量（推荐）**：设置环境变量 `DB_PASSWORD`
  - PowerShell：`$env:DB_PASSWORD = "你的密码"`
  - 或在 IDEA 的 Run Configuration → Environment variables 中设置
- **默认值**：未设置环境变量时，使用配置文件中 `${DB_PASSWORD:默认值}` 的默认值

### 4. 构建与部署

```bash
mvn clean package
```

将生成的 `target/score-manage-1.0-SNAPSHOT.war` 部署到 Tomcat，或直接在 IDEA 中配置 Tomcat 运行。

### 5. 访问

浏览器打开 `http://localhost:8080/admin/toLogin` 登录后使用。

## 安全说明

- 真实数据库配置文件 `db.properties` 已加入 `.gitignore`，不会提交到仓库
- 数据库密码优先从环境变量 `DB_PASSWORD` 读取，避免敏感信息入库
