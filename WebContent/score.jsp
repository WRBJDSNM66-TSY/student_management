<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>成绩查询</title>
</head>
<body>
<style type="text/css">
body {
   background:url("picture/5.jpg");
   background-repeat: no-repeat;
   background-size: cover;
}
</style>

<%
String Stu_id=request.getParameter("Stu_id");
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
    	sql="select * from score where stu_id="+Stu_id;
    	ResultSet rs=stmt.executeQuery(sql);
    	
  
%>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<center>
<table width="600" border="1" cellspacing="0" cellpadding="6">
<tr> 
      <td width="120" align="center" valign="middle">stu_id</td>
      <td width="145" align="center">stu_name</td>
      <td width="145" align="center">Chinese</td>
      <td width="145" align="center">Math</td>
      <td width="145" align="center">English</td>
      <td width="145" align="center">Synthesis</td>
</tr>
<%
    while(rs.next()){
    	int stu_id=rs.getInt(1);
    	String stu_name=rs.getString(2);
    	String Chinese=rs.getString(3);
    	String Math=rs.getString(4);
    	String English=rs.getString(5);
    	String Synthesis=rs.getString(6);
%> 
<tr>     
       <td height="40" align="center" valign="middle"><%=stu_id%></td>
       <td align="center" valign="middle"><%=stu_name%></td>
       <td align="center" valign="middle"><%=Chinese%></td>
       <td align="center" valign="middle"><%=Math%></td>
       <td align="center" valign="middle"><%=English%></td>
       <td align="center" valign="middle"><%=Synthesis%></td>
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