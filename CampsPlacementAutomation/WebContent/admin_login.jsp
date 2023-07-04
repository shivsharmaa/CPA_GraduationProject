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
String ad_username=request.getParameter("ad_username"); 

String ad_pass=request.getParameter("ad_pass"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cpa","root","root");
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from admin1 where ad_username='"+ad_username+"' and ad_pass='"+ad_pass+"'"); 
try44444444
rs.next();
if(rs.getString("ad_pass").equals(ad_pass)&&rs.getString("ad_username").equals(ad_username)) 
{ 
response.sendRedirect("dash-admin.html"); 
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