<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>

<%
String com_name=request.getParameter("com_name");
String connurl = "jdbc:mysql://localhost:3306/cpa";
Connection con=null;

%>
<!DOCTYPE html>
<html>
<head>
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrapp/css/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrapp/js/bootstrap.min.js">
    <style>
    td,th,h3,p{
  		font-family: "Comic Sans MS";

  	}
  	</style>
</head>
<body>

	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		<ul class="navbar-nav">
			<li class="nav-item ">
				<h3 style="margin-right: 850px"><a href="#" class="nav-link">Company Info</a></h3>
			</li>
			
			</ul>
		
	</nav>

<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(connurl, "root", "root");
	Statement st=con.createStatement();
	ResultSet resultSet=st.executeQuery("select * from company2 where com_name='"+com_name+"'");
 while(resultSet.next()){
%>	


<p>Registraton No.:<%=resultSet.getString("com_reg") %></p>
<p>Company Name:<%=resultSet.getString("com_name") %></p>
<p>Contact No.:<%=resultSet.getString("com_contact") %></p>
<p>Email:<%=resultSet.getString("com_email") %></p>

<%
}


	Statement st1=con.createStatement();
	ResultSet rs1 =st1.executeQuery("select * from company3 where com_name='"+com_name+"'");
	while(rs1.next()){
		%>
<p>Website:<a href="https://<%=rs1.getString("com_website") %>"><%=rs1.getString("com_website") %></a></p>
<p> For Branch:<%=rs1.getString("com_branch") %></p>
<p> Numer of Vacancies:<%=rs1.getString("com_vac") %></p>
<p> Apply Link:<a href="<%=rs1.getString("com_apply") %>"> <%=rs1.getString("com_apply") %></a></p>

	<%}
	

}
catch(Exception e){
out.println(e);
}
%>