<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
String com_email=request.getParameter("com_email");
String com1_pass=request.getParameter("com1_pass");
String com2_pass=request.getParameter("com2_pass");
String com3_conpass=request.getParameter("com3_pass");
String connurl = "jdbc:mysql://localhost:3306/cpa";
Connection con=null;
String pass="";
int id=0;
try{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(connurl, "root", "root");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from company2 where com_email='"+com_email+"' and com_pass='"+com1_pass+"'");

if(com1_pass.equals(com1_pass) && com_email.equals(com_email)){
Statement st1=con.createStatement();
int i=st1.executeUpdate("update company2 set com_pass='"+com2_pass+"' where com_email='"+com_email+"'");
response.sendRedirect("dash-company.html");
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