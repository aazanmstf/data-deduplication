<%@ page import="java.sql.Connection,java.sql.ResultSet,java.sql.Statement" %>
<%@ page import="com.DBConnect.Dataduplicate.DbConnection" %>
<!DOCTYPE html>
<html><head><meta charset="UTF-8"><title>User Details</title>
<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"></head>
<body class="container py-5">
  <p><a href="Attackers.jsp">&larr; Back to monitoring</a></p>
  <h1>User Details</h1><p>This page intentionally does not display passwords.</p>
  <table class="table table-bordered"><thead><tr><th>Name</th><th>Email</th><th>Age</th><th>Gender</th><th>Status</th><th>Logins</th></tr></thead><tbody>
<%
try (Connection con = DbConnection.connect(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery("SELECT name, email, age, gen, status1, logins FROM user")) {
  while (rs.next()) {
%>
<tr><td><%= rs.getString("name") %></td><td><%= rs.getString("email") %></td><td><%= rs.getString("age") %></td><td><%= rs.getString("gen") %></td><td><%= rs.getString("status1") %></td><td><%= rs.getInt("logins") %></td></tr>
<%  }
} catch (Exception e) { %><tr><td colspan="6">Unable to load user records. Check the local database setup.</td></tr><% } %>
  </tbody></table>
</body></html>
