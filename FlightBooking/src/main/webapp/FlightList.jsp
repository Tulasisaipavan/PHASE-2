<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br>
<a href=HomePage.jsp style="color:black;text-decoration:none;font-size:35px;fontweight:bold;">Flight Booking</a>
<br><br>
<%
@SuppressWarnings("unchecked")
List<String[]> flights=(List<String[]>)session.getAttribute("flights");
String name=request.getParameter("from");
String name1=request.getParameter("to");
String name2=request.getParameter("departure");
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "flyaway";
String userId = "root";
String password = "Pavan@2317";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
PreparedStatement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>Avaliable Flights</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>name</b></td>
<td><b>from</b></td>
<td><b>to</b></td>
<td><b>date</b></td>
<td><b>time</b></td>
<td><b>price</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.prepareStatement("select * from flights where fromf=? and tof=? and datef=?");
statement.setString(1,name);
statement.setString(2,name1);
statement.setString(3,name2);


resultSet = statement.executeQuery();
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("fromf") %></td>
<td><%=resultSet.getString("tof") %></td>
<td><%=resultSet.getString("datef") %></td>
<td><%=resultSet.getString("timef") %></td>
<td><%=resultSet.getString("price") %></td>
<td><a href=BookFlight.jsp>Book Now</a></td>
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