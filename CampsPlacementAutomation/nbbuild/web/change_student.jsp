<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
String stu_rollno=request.getParameter("stu_rollno");
String stu1_pass=request.getParameter("stu1_pass");
String stu2_pass=request.getParameter("stu2_pass");
String stu3_conpass=request.getParameter("stu3_pass");
String connurl = "jdbc:mysql://localhost:3306/cpa";
Connection con=null;
String pass="";
int id=0;
try{
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(connurl, "root", "root");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from student1 where stu_rollno='"+stu_rollno+"' and stu_pass='"+stu1_pass+"'");

	if(stu1_pass.equals(stu1_pass) && stu_rollno.equals(stu_rollno)){
	Statement st1=con.createStatement();
	int i=st1.executeUpdate("update student1 set stu_pass='"+stu2_pass+"' where stu_rollno='"+stu_rollno+"'");
	response.sendRedirect("dash-student.html");
	st1.close();
	con.close();
}
else{
	response.sendRedirect("wrong.html");
}
}
catch(Exception e){
out.println(e);
}
%>