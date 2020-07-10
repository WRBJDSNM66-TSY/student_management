<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>主界面</title>
</head>
<body>

<style type="text/css">
body {
   background:url("picture/bg.jpg");
   background-repeat: no-repeat;
   background-size: cover;
}
</style>

<center><h2>学生信息管理系统</h2>
<br>
<form action="student.jsp" method="post">
   用户账号:&nbsp;<input type="text" name="username" maxlength="10"/> <br><br>
   &nbsp;&nbsp;&nbsp;&nbsp;密码:&nbsp;&nbsp;&nbsp;
  <input type="password" name="password" maxlength="10"/> <br><br>
   角色:&nbsp;&nbsp;
  <select id="role" name="role">
  <option value="student">student</option>
  <option value="admin">admin</option>
  </select>
   <br><br>
  <input type="submit" name="submit" value="提交" />
  &nbsp; &nbsp; &nbsp; &nbsp;
  <input type="reset" name="reset" value="取消" />
</form>
</center>
</body>
</html>