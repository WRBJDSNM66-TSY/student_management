<%@ page contentType="text/html; charset=UTF-8"  language="java" errorPage=""%>
<%@ page import="java.sql.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>test executeQuery</title>
</head>
<body>
<style type="text/css">
body {
   background:url("picture/17.jpg");
   background-repeat: no-repeat;
   background-size: cover;
}
</style>

<%    
  String Stu_id=request.getParameter("Stu_id");
  String Stu_name=request.getParameter("stu_name");
  String Stu_age=request.getParameter("stu_age");
  String Stu_address=request.getParameter("stu_address");
  String Stu_sex=request.getParameter("stu_sex");
  String Stu_class=request.getParameter("stu_class");

        String url = "jdbc:mysql://localhost:3306/student?serverTimezone=GMT";
		String userName = "root";
		String password = "123456";
		String sql = null;
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch(ClassNotFoundException e) {
			out.println("加载驱动器类时出现异常");
		}
		
		try {
			conn = DriverManager.getConnection(url, userName, password);
			stmt = conn.createStatement();			
			sql = "update student set Stu_id='"+Stu_id+"',Stu_name='"+Stu_name+"',Stu_age='"+Stu_age+"',Stu_address='"+Stu_address+"',Stu_sex='"+Stu_sex+"',Stu_class='"+Stu_class+"' where Stu_id="+Stu_id;
			
			//使用executeQuery执行SQL查询语句
			stmt.executeUpdate(sql);
			response.sendRedirect("update102.jsp");
			stmt.close();
			
		} catch(SQLException e) {
			out.println("出现SQLException异常");
		} finally {
			//关闭语句和数据库连接
			try {
				if (conn != null) conn.close();
			} catch(SQLException e) {
				out.println("关闭数据库连接时出现异常");
			}		
		}

%>
</body>
</html>

