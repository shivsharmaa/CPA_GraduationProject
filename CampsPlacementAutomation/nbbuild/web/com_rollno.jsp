<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>

<%
String stu_rollno=request.getParameter("stu_rollno");
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
    td,th,h3,p,a{
  		font-family: "Comic Sans MS";

  	}
  	</style>
</head>
<body>

	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		<ul class="navbar-nav">
			<li class="nav-item ">
				<h3 style="margin-right: 850px"><a href="#" class="nav-link">Student Info</a></h3>
			</li>
			
			</ul>
		
	</nav>

<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(connurl, "root", "root");
	Statement st=con.createStatement();
	ResultSet resultSet=st.executeQuery("select * from student1 where stu_rollno='"+stu_rollno+"'");
 while(resultSet.next()){
%>	

<p>Name:<%=resultSet.getString("stu_fname") %> <%=resultSet.getString("stu_lname") %></p>
<p>Roll NO.:<%=resultSet.getString("stu_rollno") %></p>
<p>College:<%=resultSet.getString("stu_college") %></p>
<p>University:<%=resultSet.getString("stu_university") %></p>
<p>Contact:<%=resultSet.getString("stu_contact") %></p>
<p>Email:<%=resultSet.getString("stu_email") %></p>

<%
}


	Statement st1=con.createStatement();
	ResultSet rs1 =st1.executeQuery("select * from student2 where stu_rollno='"+stu_rollno+"'");
	while(rs1.next()){
		%>
<p> Father Name:<%=rs1.getString("fathername") %></p>
<p> Mother Name:<%=rs1.getString("mothername") %></p>
<p> Date of Birth:<%=rs1.getString("dob") %></p>
<p> Gender:<%=rs1.getString("gender") %></p>
<p> Batch:<%=rs1.getString("batch") %></p>
<p> Branch:<%=rs1.getString("branch") %></p>
<p> Year:<%=rs1.getString("year") %></p>
<p> HighSchool Year:<%=rs1.getString("hsy") %></p>
<p> HighSchool Percentage:<%=rs1.getString("hsp") %></p>
<p> Intermediate Year:<%=rs1.getString("imy") %></p>
<p> Intermediate Percentage:<%=rs1.getString("imp") %></p>
<p> Aggregate Percentage:<%=rs1.getString("aggp") %></p>

	<%}
	

}
catch(Exception e){
out.println(e);
}
%>