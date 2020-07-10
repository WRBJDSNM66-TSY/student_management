<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html ; charset=UTF-8">
<title>缴费信息管理</title>
</head>
<body>
  			<style type="text/css">
body {
   background:url("picture/18.jpg");
   background-repeat: no-repeat;
   background-size: cover;
}
</style>

<%
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
    	sql="select * from jiaofei";
    	ResultSet rs=stmt.executeQuery(sql);
    	
  
%>
<br><br>
<center>
<table width="700" border="1" cellspacing="0" cellpadding="6">
<tr> 
      <td width="120" align="center" valign="middle">stu_id</td>
      <td width="145" align="center">stu_name</td>
      <td width="145" align="center">j_message</td>
      <td width="145" align="center">j_need</td>
      <td width="145" align="center">操作</td>
      <td width="145" align="center">操作</td>
</tr>
<%
    while(rs.next()){
    	int stu_id=rs.getInt(1);
    	String stu_name=rs.getString(2);
    	String j_message=rs.getString(3);
    	String j_need=rs.getString(4);
%> 
<tr>     
       <td height="40" align="center" valign="middle"><%=stu_id%></td>
       <td align="center" valign="middle"><%=stu_name%></td>
       <td align="center" valign="middle"><%=j_message%></td>
       <td align="center" valign="middle"><%=j_need%></td>
       <td align="center" valign="middle"><a href="delete4.jsp?stu_id=<%=stu_id%>">删除</a></td>  
       <td align="center" valign="middle"><a href="update4.jsp?stu_id=<%=stu_id%>">修改</a></td>
       
       
       
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
</center>
</table>
<br><br>
<a href="add4.jsp"><font size="5">增加缴费信息</font></a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="javascript:history.go(-1);"><font size="5">返回上一页</font></a>
<br><br><br>
</body>
</html>



