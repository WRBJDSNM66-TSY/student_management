<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新角色注册</title>
</head>
<body>
  			<style type="text/css">
body {
   background:url("picture/16.jpg");
   background-repeat: no-repeat;
   background-size: cover;
}
</style>

<form action="04.jsp" method="post">
<center>
<br>
<h2>新角色注册</h2>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     请输入Stu_id:&nbsp;&nbsp;&nbsp;&nbsp<input type="text" name="Stu_id" maxlength="15"><br><br>
     
     请输入U_password:&nbsp;&nbsp;&nbsp;<input type="text" name="U_password" maxlength="15"><br><br>
  
     请输入role:&nbsp;&nbsp;&nbsp;<input type="text" name="role" maxlength="20"><br><br>
<p>
<input type="submit" value="注册">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" value="重填">  
</p>
<a href="javascript:history.go(-1);">返回上一页</a>
</center>
</form>
</body>
</html>