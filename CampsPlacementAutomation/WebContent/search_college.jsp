<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>

<%
String coll_name=request.getParameter("coll_name");
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
				<h3 style="margin-right: 850px"><a href="#" class="nav-link">College Info</a></h3>
			</li>
			
			</ul>
		
	</nav>

<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(connurl, "root", "root");
	Statement st=con.createStatement();
	ResultSet resultSet=st.executeQuery("select * from college2 where coll_name='"+coll_name+"'");
 while(resultSet.next()){
%>	


<p>College Name:<%=resultSet.getString("coll_name") %></p>
<p>College University:<%=resultSet.getString("coll_uni") %></p>
<p>Employee Id:<%=resultSet.getString("coll_eid") %></p>
<p>Contact No.:<%=resultSet.getString("coll_contact") %></p>
<p>Email:<%=resultSet.getString("coll_email") %></p>

<%
}

}
catch(Exception e){
out.println(e);
}
%>