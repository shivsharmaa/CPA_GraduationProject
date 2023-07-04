<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Detail</title>
</head>
<body>
<%@page import="java.sql.*,java.util.*"%>

<%
String stu_rollno=request.getParameter("stu_rollno");
String fathername=request.getParameter("fathername");
String mothername=request.getParameter("mothername");
String dob=request.getParameter("dob");
String gender=request.getParameter("gender");
String batch=request.getParameter("batch");
String branch=request.getParameter("branch");
String year=request.getParameter("year");
String hsy=request.getParameter("hsy");
String hsp=request.getParameter("hsp");
String imy=request.getParameter("imy");
String imp=request.getParameter("imp");
String aggp=request.getParameter("aggp");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cpa", "root", "root");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into student2(stu_rollno,fathername,mothername,dob,gender,batch,branch,year,hsy,hsp,imy,imp,aggp)values('"+stu_rollno+"','"+fathername+"','"+mothername+"','"+dob+"','"+gender+"','"+batch+"','"+branch+"','"+year+"','"+hsy+"','"+hsp+"','"+imy+"','"+imp+"','"+aggp+"')");
response.sendRedirect("dash-student.html");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</body>
</html>