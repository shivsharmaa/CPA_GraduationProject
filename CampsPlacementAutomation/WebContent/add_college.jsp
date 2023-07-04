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
String coll_name=request.getParameter("coll_name");
String coll_uni=request.getParameter("coll_uni");
String coll_eid=request.getParameter("coll_eid");
String coll_contact=request.getParameter("coll_contact");
String coll_email=request.getParameter("coll_email");
String coll_pass=request.getParameter("coll_pass");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cpa", "root", "root");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into college2(coll_name,coll_uni,coll_eid,coll_contact,coll_email,coll_pass)values('"+coll_name+"','"+coll_uni+"','"+coll_eid+"','"+coll_contact+"','"+coll_email+"','"+coll_pass+"')");
response.sendRedirect("request_college.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</body>
</html>