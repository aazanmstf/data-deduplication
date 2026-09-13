<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.DBConnect.Dataduplicate.DbConnection"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Deduplication - About</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/main.css">
</head>
<body>
    <header class="header">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Data Deduplication</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-white" href="UserDetails.jsp">User Request</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-white" href="akey.jsp">KEY SHARE</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link nav-link-white" href="okey.jsp">Verify User</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-white" href="index.html">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <style>
    body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}


.header {
    background-color: #333;
    color: #fff;
    padding: 20px;
    text-align: center;
}

.navbar-brand {
    font-size: 24px;
    font-weight: bold;
}

.navbar-nav {
    margin-right: 20px;
}

.nav-link {
    color: #333;
    transition: color 0.2s ease;
}

.nav-link:hover {
    color: #666;
}

.about-section {
    padding: 40px;
}

.table {
    width: 100%;
    border-collapse: collapse;
}

.table th, .table td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: left;
}

.table th {
    background-color: #f0f0f0;
}

.footer {
    background-color: #333;
    color: #fff;
    padding: 10px;
    text-align: center;
    clear: both;
}
.nav-link-white {
    color: white;
}
    
    
    </style>
    <main class="main">
        <section class="about-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                      
                        <center><h1>PROXY SERVER HAS A ADDED USER SUCESSFULLY!</h1></center>
                    </div> 
                </div>
            </div>
        </section>
        
        <br><br><br><br><br><br><br><br><br><br> <br><br><br><br><br><br><br><br><br><br> <br><br><br><br>
    </main>
    <footer class="footer">
        <div class="container">
            <p>&copy; 2023 Data Deduplication. All Rights Reserved.</p>
        </div>
    </footer>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>