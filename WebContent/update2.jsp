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
   background:url("picture/16.jpg");
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
			sql = "SELECT * FROM score where stu_id="+Stu_id;
			ResultSet rs = stmt.executeQuery(sql);
			

			//显示返回的结果集
			while (rs.next()) {
				int stu_id=rs.getInt(1);
		    	String stu_name=rs.getString(2);
		    	String Chinese=rs.getString(3);
		    	String Math=rs.getString(4);
		    	String English=rs.getString(5);
		    	String Synthesis=rs.getString(6);
			
			%>
<br><br>			
			<center><h2>信息修改页面</h2></center>
<br>

<form name="form1" method="post" action="update201.jsp?Stu_id=<%=stu_id %>" >

<p align="center">stu_id：<input type="text" name="stu_id" readonly="true" value=<%=stu_id%>></p>
<p align="center">stu_name：<input type="text" name="stu_name" readonly="true" value=<%=stu_name%>></p>
<p align="center">Chinese: <input type="text" name="Chinese" value=<%=Chinese%>></p>
<p align="center">Math: <input type="text" name="Math" value=<%=Math%>></p>
<p align="center">English: <input type="text" name="English" value=<%=English%>></p>
<p align="center">Synthesis: <input type="text" name="Synthesis" value=<%=Synthesis%>></p>

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