<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>

<%
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
    td,th,h3,h5{
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


<table class="table mt-3">
<thead class="thead-dark">
<tr>
<th>College Name</th>
<th>Full Detail</th>
<th>Delete </th>
</tr>
</thead>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(connurl, "root", "root");
	Statement st=con.createStatement();
	ResultSet resultSet=st.executeQuery("select * from college2");
 while(resultSet.next()){
%>	
<tr>
<td><%=resultSet.getString("coll_name") %></td>
<td><a href="search_college.jsp?coll_name=<%=resultSet.getString("coll_name") %>"><button type="button" class="delete">fulldetail</button></a></td>
</tr>

<%
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

</body>
</html>