<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
String coll_email=request.getParameter("coll_email");
String coll1_pass=request.getParameter("coll1_pass");
String coll2_pass=request.getParameter("coll2_pass");
String coll3_conpass=request.getParameter("coll3_pass");
String connurl = "jdbc:mysql://localhost:3306/cpa";
Connection con=null;
String pass="";
int id=0;
try{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(connurl, "root", "root");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from college2 where coll_email='"+coll_email+"' and coll_pass='"+coll1_pass+"'");

if(coll1_pass.equals(coll1_pass) && coll_email.equals(coll_email)){
Statement st1=con.createStatement();
int i=st1.executeUpdate("update college2 set coll_pass='"+coll2_pass+"' where coll_email='"+coll_email+"'");
response.sendRedirect("dash-college.html");
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