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
   background:url("picture/18.jpg");
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
    	sql="select * from student";
    	ResultSet rs=stmt.executeQuery(sql);
    	
  
%>
<br><br>
<center>
<table width="600" border="1" cellspacing="0" cellpadding="6">
<tr> 
      <td width="120" align="center" valign="middle">Stu_id</td>
      <td width="145" align="center">Stu_name</td>
      <td width="145" align="center">Stu_age</td>
      <td width="145" align="center">Stu_address</td>
      <td width="145" align="center">Stu_sex</td>
      <td width="145" align="center">Stu_class</td>
</tr>
<%
    while(rs.next()){
    	int Stu_id=rs.getInt(1);
    	String Stu_name=rs.getString(2);
    	String Stu_age=rs.getString(3);
    	String Stu_address=rs.getString(4);
    	String Stu_sex=rs.getString(5);
    	String Stu_class=rs.getString(6);
%> 
<tr>     
       <td height="40" align="center" valign="middle"><%=Stu_id%></td>
       <td align="center" valign="middle"><%=Stu_name%></td>
       <td align="center" valign="middle"><%=Stu_age%></td> 
       <td align="center" valign="middle"><%=Stu_address%></td> 
       <td align="center" valign="middle"><%=Stu_sex%></td> 
       <td align="center" valign="middle"><%=Stu_class%></td> 
       
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
<br>
</center>
</body>
</html>



