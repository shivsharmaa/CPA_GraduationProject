<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>College Login</title>
</head>
<body>
<%@page import="java.sql.*,java.util.*"%>
<%
String coll_email=request.getParameter("coll_email"); 

String coll_pass=request.getParameter("coll_pass"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cpa","root","root");
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from college2 where coll_email='"+coll_email+"' and coll_pass='"+coll_pass+"'"); 

try{
rs.next();
String coll_name=rs.getString("coll_name");
if(rs.getString("coll_pass").equals(coll_pass)&&rs.getString("coll_email").equals(coll_email)) 
{ 
response.sendRedirect("dash-college.html"); 
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