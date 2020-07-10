<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新成绩注册</title>
</head>
<body>
  			<style type="text/css">
body {
   background:url("picture/16.jpg");
   background-repeat: no-repeat;
   background-size: cover;
}
</style>

<form action="03.jsp" method="post">
<center>
<h2>新用户注册</h2>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     请输入Stu_id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="Stu_id" maxlength="15"><br><br>
   &nbsp;&nbsp;&nbsp;&nbsp;
     请输入Stu_name:&nbsp;&nbsp;<input type="text" name="Stu_name" maxlength="15"><br><br>
  
     请输入Chinese:&nbsp;&nbsp;&nbsp;<input type="text" name="Chinese"><br><br>
   &nbsp;&nbsp;&nbsp;&nbsp;
     请输入Math：<input type="text" name="Math" maxlength="20"><br><br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     请输入English：&nbsp;&nbsp;<input type="text" name="English"><br><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     请输入Synthesis：&nbsp;&nbsp;<input type="text" name="Synthesis">
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