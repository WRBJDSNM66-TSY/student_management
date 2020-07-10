<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录信息</title>
</head>
<body>
<style type="text/css">
body {
   background:url("picture/7.jpg");
   background-repeat: no-repeat;
   background-size: cover;
}
</style>

<%
String stu_id=request.getParameter("Stu_id");
    String url="jdbc:mysql://localhost:3306/Student?serverTimezone=GMT";
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
    	//String id=request.getParameter("username");
    	sql="select * from user where stu_id="+stu_id;
    	ResultSet rs=stmt.executeQuery(sql);
    	
  
%>
<br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br>
<center>
<table width="600" border="1" cellspacing="0" cellpadding="6">
<tr> 
      <td width="120" align="center" valign="middle">stu_id</td>
      <td width="145" align="center">U_password</td>
      <td width="145" align="center">操作</td>
</tr>
<%
    while(rs.next()){
    	int Stu_id=rs.getInt(1);
    	String U_password=rs.getString(2);
%> 
<tr>     
       <td height="40" align="center" valign="middle"><%=Stu_id%></td>
       <td align="center" valign="middle"><%=U_password%></td>
       <td align="center" valign="middle"><a href="update.jsp?Stu_id=<%=Stu_id%>">修改</a></td>
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
  String id=request.getParameter("username");
  System.out.print(id);
%>
</center>
</table>
<br>
<a href="javascript:history.go(-1);">返回上一页</a>
</body>
</html>