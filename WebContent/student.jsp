<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生界面</title>
</head>
<body>
<%
    String n=request.getParameter("username");
    String p=request.getParameter("password");
    String r=request.getParameter("role");
	 
   String url="jdbc:mysql://localhost:3306/Student?serverTimezone=GMT";
   String userName="root";
   String password="123456";
   String sql=null;
   Connection conn=null;
   Statement stmt=null;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
}catch(ClassNotFoundException e){
	out.print("加载驱动程序器类时出现异常！");
}
try {
	conn = DriverManager.getConnection(url, userName, password);
	
	stmt = conn.createStatement();			
	sql="select * from user";
	ResultSet rs= stmt.executeQuery(sql);

      while(rs.next()){
    	  String name =rs.getString(1);
    	  String password1=rs.getNString(2);
    	  String role1=rs.getNString(3);
    	  
    	  if(name.equals(n) && password1.equals(p) && r.equals(role1) ){ 
  %>			  
  			<style type="text/css">
  			body {
  			   background:url("picture/1.jpg");
  			   background-repeat: no-repeat;
  			   background-size: cover;
  			}
  			</style>
  			<center>
  			<br><br><br><br>
  			<h1>
<%
  			String user=request.getParameter("username");
  			out.print("欢迎您！账号为："+" "+user+"  "+"的同学！");
 %>
  			<br><br><br>
  			</h1>
  			<a href="select.jsp?Stu_id=<%=user%>"><font size="6">查询个人信息</font></a>
  			<br><br>
  			<a href="score.jsp?Stu_id=<%=user%>"><font size="6">查询成绩</font></a>
  	        <br><br> 
  			<a href="manage.jsp?Stu_id=<%=user%>"><font size="6">登录信息管理</font></a>
  			<br><br><br><br><br>
<%
  		
    	  }
  		}
      
    rs.close();
	stmt.close();
	
      } catch(SQLException e) {
    		out.println("连接数据库的过程中出现SQL异常");
    	} 
      
if(conn==null){
	out.print("连接数据库失败");
}
try{
	conn.close();
}catch(SQLException e){
	out.print("关闭数据库连接时出现SQL异常");
}
%>
<a href="javascript:history.go(-1);">返回上一页</a>
            </center>
</body>
</html>
