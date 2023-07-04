<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*,java.util.*"%>
<%
String stu_rollno=request.getParameter("stu_rollno"); 

String stu_pass=request.getParameter("stu_pass"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cpa","root","root");
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from student1 where stu_rollno='"+stu_rollno+"' and stu_pass='"+stu_pass+"'"); 
try{
rs.next();
if(rs.getString("stu_pass").equals(stu_pass)&&rs.getString("stu_rollno").equals(stu_rollno)) 
{ 
response.sendRedirect("dash-student.html"); 
} 
else{
out.println("Invalid password or username.");
}
}
catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>