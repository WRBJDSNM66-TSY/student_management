<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册结果</title>
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
 	String Stu_id=request.getParameter("Stu_id");
    String Stu_name=request.getParameter("Stu_name");
    String j_message=request.getParameter("j_message");
    String j_need=request.getParameter("j_need");
 	

    String url = "jdbc:mysql://localhost:3306/student?serverTimezone=GMT";
	String userName = "root";
	String password = "123456";
	String sql = null;
	Connection conn = null;
	Statement stmt = null;
	 ResultSet r=null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
	} catch(ClassNotFoundException e) {
		out.println("加载驱动器类时出现异常");
	}
    
 try{
 	conn=DriverManager.getConnection(url,userName,password);
 	stmt=conn.createStatement();
    sql="select * from jiaofei";
 	r=stmt.executeQuery(sql);
 	while(r.next()){
 		String user=r.getString(1);

 		if(Stu_id.equals(user)){
 			out.println("用户已存在！");
 		}else{
 			String sql1="insert into jiaofei values ('"+Stu_id+"','"+Stu_name+"','"+j_message+"','"+j_need+"')";
 			stmt.executeUpdate(sql1);
 			%>
 			<p>注册成功！！！</p>
 			<p>三秒钟后自动转到查看页面！！！</p>
 			<meta http-equiv="refresh" content="3;url=http://localhost:8080/BigWork/money.jsp" />
 		    <p>如果没有跳转，请点击<a href="money.jsp">这里</a></p>
 			<%
 		}
 	}
 	r.close();
 	stmt.close();
 
 }catch(SQLException e){

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

</body>
</html>