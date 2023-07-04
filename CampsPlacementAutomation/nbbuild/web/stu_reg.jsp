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
String first_name=request.getParameter("first_name");
String last_name=request.getParameter("last_name");
String rollno=request.getParameter("rollno");
String college=request.getParameter("college");
String uni=request.getParameter("uni");
String ph=request.getParameter("ph");
String your_email=request.getParameter("your_email");
String password=request.getParameter("password");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cpa", "root", "root");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into student1(stu_fname,stu_lname,stu_rollno,stu_college,stu_university,stu_contact,stu_email,stu_pass)values('"+first_name+"','"+last_name+"','"+rollno+"','"+college+"','"+uni+"','"+ph+"','"+your_email+"','"+password+"')");
response.sendRedirect("index.html");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</body>
</html>