<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "cpa";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
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
<div class="container-fluid">
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		<ul class="navbar-nav">
			<li class="nav-item ">
				<h3 style="margin-right: 850px"><a href="#" class="nav-link">Admin Dashboard</a></h3>
			</li>
			<li class="nav-item">
				<h5><a href="add_company.html" class="nav-link">ADD</a></h5>
			</li>
			</ul>
		
	</nav>


<table class="table mt-3">
<thead class="thead-dark">
<tr>
<th>Registration No.</th>
<th>Name</th>
<th>Contact</th>
<th>Email</th>
<th>Password</th>
<th>Delete Request</th>
</tr>
</thead>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from company1";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("com_reg") %></td>
<td><%=resultSet.getString("com_name") %></td>
<td><%=resultSet.getString("com_contact") %></td>
<td><%=resultSet.getString("com_email") %></td>
<td><%=resultSet.getString("com_pass") %></td>
<td><a href="delete_company.jsp?idcompany1=<%=resultSet.getString("idcompany1") %>"><button type="button" class="delete">Delete</button></a></td>

</tr>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</div>
</body>
</html>