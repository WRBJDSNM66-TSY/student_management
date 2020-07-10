<%@ page contentType="text/html; charset=UTF-8"  language="java" errorPage=""%>
<%@ page import="java.sql.*" %>
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

<%      String Stu_id=request.getParameter("stu_id");
        String url = "jdbc:mysql://localhost:3306/Student?serverTimezone=GMT";
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
			sql = "SELECT * FROM user where stu_id="+Stu_id;
			ResultSet rs = stmt.executeQuery(sql);
			

			//显示返回的结果集
			while (rs.next()) {
				int stu_id=rs.getInt(1);
		    	String U_password=rs.getString(2);
		    	String role=rs.getString(3);
			
			%>
<br><br>			
			<center><h2>用户信息修改页面</h2></center>
<br>

<form name="form1" method="post" action="update301.jsp?Stu_id=<%=stu_id %>" >
<p align="center">Stu_id： <input type="text" name="Stu_id" readonly="true" value=<%=stu_id%>></p>
<p align="center">U_password： <input type="text" name="U_password" value=<%=U_password%>></p>
<p align="center">role: <input type="text" name="role" value=<%=role%>></p>

<p align="center"><input type="submit" name="Submit" value="提交">
&nbsp; &nbsp; <input name="cancel" type="reset" id="cancel" value="取消">
</p>
</form>
<%			}
			rs.close();
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
<br><br>
<center>
<a href="javascript:history.go(-1);">返回上一页</a>
</center>
</body>
</html>