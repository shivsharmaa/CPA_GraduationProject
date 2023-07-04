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
String com_website=request.getParameter("com_website");
String com_branch=request.getParameter("com_branch");
String com_vac=request.getParameter("com_vac");
String com_apply=request.getParameter("com_apply");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cpa", "root", "root");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into company3(com_name,com_website,com_branch,com_vac,com_apply)values('"+com_name+"','"+com_website+"','"+com_branch+"','"+com_vac+"','"+com_apply+"')");
response.sendRedirect("dash-company.html");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</body>
</html>