<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
String ad1_pass=request.getParameter("ad1_pass");
String ad2_pass=request.getParameter("ad2_pass");
String ad3_conpass=request.getParameter("ad3_pass");
String connurl = "jdbc:mysql://localhost:3306/cpa";
Connection con=null;
String pass="";
int id=0;
try{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(connurl, "root", "root");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from admin1 where ad_pass='"+ad1_pass+"'");

if(ad1_pass.equals(ad1_pass)){
Statement st1=con.createStatement();
int i=st1.executeUpdate("update admin1 set ad_pass='"+ad2_pass+"' where ad_pass='"+ad1_pass+"'");
response.sendRedirect("wait.html");
st1.close();
con.close();
}
else{
	response.sendRedirect("request_company.jsp");
}
}
catch(Exception e){
out.println(e);
}
%>