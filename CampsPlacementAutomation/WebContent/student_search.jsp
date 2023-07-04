<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Student-Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
	<style>
	table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
  }
th,td,font{font-family:Times New Roman;}

tr:hover {background-color:#f5f5f5;}
</style>
</head>
<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1 col-sm-11" href="student-dash.html">Student-Dashboard</a>

	<a  class="navbar-brand col-sm-1"  href="logout.jsp">Logout</a>

  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav col-sm-3">
      <li class="nav-item active">
        <a class="nav-link" href="student-dash.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="tables.html">
         <i class="fa fa-user"></i>
          <span>Edit Profile</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="tables.html">
         <i class="fa fa-building"></i>
          <span>Company</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="tables.html">
         <i class="fa fa-heart"></i>
          <span>Apply for Training</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="tables.html">
         <i class="fa fa-folder"></i>
          <span>Study Material</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="tables.html">
          <i class="fa fa-star"></i>
          <span>Notification</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="tables.html">
         <i class="fa fa-envelope"></i>
          <span>Mail</span></a>
      </li>
    </ul>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String stu_rollno = request.getParameter("stu_rollno");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "cpa";
String userId = "root";
String password = "root";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<div class="tb col-sm-9">
<h4 align="center"><font><strong>Student Details</strong></font></h4>
<table align="center" >
<tr>

</tr>
<tr bgcolor="#0CFE85">
<td><b>First Name</b></td>
<td><b>Last Name</b></td>
<td><b>Rollno</b></td>
<td><b>College</b></td>
<td><b>UNIVERSITY</b></td>
<td><b>CONTACT NO.</b></td>
<td><b>EMAIL</b></td>

</tr>
</div>
<%
try{ 

connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM college1 where stu_rollno="+stu_rollno+"";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<div class="tb col-sm-9">
<tr>

<td><%=resultSet.getString("coll_name") %></td>
<td><%=resultSet.getString("coll_uni") %></td>
<td><%=resultSet.getString("coll_eid") %></td>
<td><%=resultSet.getString("coll_contact") %></td>
<td><%=resultSet.getString("coll_email") %></td>


</tr>


<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</div>

      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Campus Placement Automation 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

 
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

 
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="vendor/chart.js/Chart.min.js"></script>
  <script src="vendor/datatables/jquery.dataTables.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="js/demo/datatables-demo.js"></script>
  <script src="js/demo/chart-area-demo.js"></script>


</body>
</html>