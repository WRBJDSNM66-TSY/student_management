<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html ; charset=UTF-8">
<title>混合操作</title>
</head>
<body>
<style type="text/css">
body {
   background:url("picture/9.jpg");
   background-repeat: no-repeat;
   background-size: cover;
}
</style>

<%
    String url="jdbc:mysql://localhost:3306/student?serverTimezone=GMT";
    String userName="root";
    String password="123456";
    String sql=null;
    Connection conn=null;
    Statement stmt=null;
    try{
    	Class.forName("com.mysql.cj.jdbc.Driver");
    }catch(ClassNotFoundException e){
    	out.print("加载驱动类时异常！");
    }
    try{
    	conn=DriverManager.getConnection(url, userName, password);
    	stmt=conn.createStatement();
    	sql="select * from user";
    	ResultSet rs=stmt.executeQuery(sql);
    	
  
%>
<br><br>
<center>
<table width="600" border="1" cellspacing="0" cellpadding="6">
<tr> 
      <td width="120" align="center" valign="middle">Stu_id</td>
      <td width="145" align="center">U_password</td>
      <td width="145" align="center">role</td>
</tr>
<%
    while(rs.next()){
    	int Stu_id=rs.getInt(1);
    	String U_password=rs.getString(2);
    	String role=rs.getString(3);
%> 
<tr>     
       <td height="40" align="center" valign="middle"><%=Stu_id%></td>
       <td align="center" valign="middle"><%=U_password%></td>
       <td align="center" valign="middle"><%=role%></td> 
       
</tr>
<%}
   rs.close();
    stmt.close();
    }catch(SQLException e){
    	out.print("出现SQLException异常！");
    }
    try{
      if(conn!=null)
    	 conn.close();
    }catch(SQLException e){
    	out.print("关闭数据库时异常！");
    }
%>

</table>
<br><br>
<a href="javascript:history.go(-1);">修改成功！返回上一页</a>
</center>

</body>
</html>



