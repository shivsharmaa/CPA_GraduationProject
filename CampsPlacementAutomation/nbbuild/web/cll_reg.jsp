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
String college=request.getParameter("college");
String uni_code=request.getParameter("uni_code");
String E_id=request.getParameter("E_id");
String ph=request.getParameter("ph");
String your_email=request.getParameter("your_email");
String password=request.getParameter("password");


try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cpa", "root", "root");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into college1(coll_name,coll_uni,coll_eid,coll_contact,coll_email,coll_pass)values('"+college+"','"+uni_code+"','"+E_id+"','"+ph+"','"+your_email+"','"+password+"')");
response.sendRedirect("wait.html");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</body>
</html>