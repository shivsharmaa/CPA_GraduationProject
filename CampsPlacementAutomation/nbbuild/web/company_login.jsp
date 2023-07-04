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
String com_email=request.getParameter("com_email"); 

String com_pass=request.getParameter("com_pass"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cpa","root","root");
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from company2 where com_email='"+com_email+"' and com_pass='"+com_pass+"'"); 
try{
rs.next();
if(rs.getString("com_pass").equals(com_pass)&&rs.getString("com_email").equals(com_email)) 
{ 
response.sendRedirect("dash-company.html"); 
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