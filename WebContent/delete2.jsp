<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %> 
    <%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="test/html ; charset=UTF-8">
<title>删除</title>
</head>
<body>
  			<style type="text/css">
body {
   background:url("picture/19.jpg");
   background-repeat: no-repeat;
   background-size: cover;
}
</style>

<%
String stu_id=request.getParameter("stu_id");

   String url="jdbc:mysql://localhost:3306/student?serverTimezone=GMT";
   String userName="root";
   String password="123456";
   String sql=null;
   Connection conn=null;
   Statement stmt=null;
   try{
	   Class.forName("com.mysql.cj.jdbc.Driver");
   }catch(ClassNotFoundException e){
	   out.println("加载驱动器类时出现异常！");
   }
   
   try {
		conn = DriverManager.getConnection(url, userName, password);
		
		stmt = conn.createStatement();			
		sql = "delete from score where stu_id="+stu_id;
		
		 stmt.executeUpdate(sql);
		 response.sendRedirect("score1.jsp");
		stmt.close();
		
	} catch(SQLException e) {
		out.println("出现SQLException异常");
	}
		out.println("命令已成功执行！");
		
		try {
			if (conn != null) 
				conn.close();
		} catch(SQLException e) {
			out.println("关闭数据库连接时出现异常");
		}	
	

%>
</body>
</html>



