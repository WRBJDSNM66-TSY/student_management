<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>缴费信息添加</title>
</head>
<body>
  			<style type="text/css">
body {
   background:url("picture/16.jpg");
   background-repeat: no-repeat;
   background-size: cover;
}
</style>


<form action="05.jsp" method="post">
<center>
<br>
<h2>缴费信息添加</h2>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     请输入Stu_id:&nbsp;&nbsp;&nbsp;&nbsp<input type="text" name="Stu_id" maxlength="15"><br><br>
     
     请输入Stu_name:&nbsp;&nbsp;&nbsp;<input type="text" name="Stu_name" maxlength="15"><br><br>
  
     请输入j_message:&nbsp;&nbsp;&nbsp;<input type="text" name="j_message" maxlength="20"><br><br>
     
     请输入j_need:&nbsp;&nbsp;&nbsp;<input type="text" name="j_need" maxlength="20"><br><br>
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