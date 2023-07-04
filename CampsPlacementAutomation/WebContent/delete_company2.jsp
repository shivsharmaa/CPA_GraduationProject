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
String com_name=request.getParameter("com_name");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cpa", "root", "root");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM company2 WHERE com_name='"+com_name+"'");
Statement st1=conn.createStatement();
int j=st1.executeUpdate("DELETE FROM company3 WHERE com_name='"+com_name+"'");
response.sendRedirect("ad_searchcollege.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</body>
</html>