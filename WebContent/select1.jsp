<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html ; charset=UTF-8">
<title>管理员操作</title>
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
    	sql="select * from student";
    	ResultSet rs=stmt.executeQuery(sql);
    	
  
%>
<br><br>
<center>
<h1>学生信息管理表</h1>
<table width="700" border="1" cellspacing="0" cellpadding="8">
<tr> 
      <td width="120" align="center" valign="middle">stu_id</td>
      <td width="145" align="center">stu_name</td>
      <td width="145" align="center">stu_age</td>
      <td width="145" align="center">stu_address</td>
      <td width="145" align="center">stu_sex</td>
      <td width="145" align="center">stu_class</td>
      <td width="145" align="center">操作</td>
      <td width="200" align="center">备注</td>
</tr>
<%
    while(rs.next()){
    	int stu_id=rs.getInt(1);
    	String stu_name=rs.getString(2);
    	String stu_age=rs.getString(3);
    	String stu_address=rs.getString(4);
    	String stu_sex=rs.getString(5);
    	String stu_class=rs.getString(6);
%> 
<tr>     
      <td height="40" align="center" valign="middle"><%=stu_id%></td>
       <td align="center" valign="middle"><%=stu_name%></td>
       <td align="center" valign="middle"><%=stu_age%></td>
       <td align="center" valign="middle"><%=stu_address%></td>
       <td align="center" valign="middle"><%=stu_sex%></td>
       <td align="center" valign="middle"><%=stu_class%></td>
       <td align="center" valign="middle"><a href="update1.jsp?stu_id=<%=stu_id%>">修改</a></td>
       <td align="center" valign="middle">若此学生退学或转学，则可修改其信息为0，但要保留学号及姓名。</a></td>

      
       
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
<a href="add1.jsp"><font size="6">增加信息</font></a>
&nbsp; &nbsp; &nbsp; &nbsp; 
<a href="javascript:history.go(-1);"><font size="6">返回上一页</font></a>
<br><br><br>
</body>
</html>



