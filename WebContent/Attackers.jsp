<%@page import="com.DBConnect.Dataduplicate.DbConnection"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Data De-Duplication</title>

    <!-- Bootstrap Core CSS -->
    <link href="asset/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome CSS -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    
    
    <!-- Animate CSS -->
    <link href="css/animate.css" rel="stylesheet" >
    
    <!-- Owl-Carousel -->
    <link rel="stylesheet" href="css/owl.carousel.css" >
    <link rel="stylesheet" href="css/owl.theme.css" >
    <link rel="stylesheet" href="css/owl.transitions.css" >

    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    
    <!-- Colors CSS -->
    <link rel="stylesheet" type="text/css" href="css/color/green.css">
    
    
    
    <!-- Colors CSS -->
    <link rel="stylesheet" type="text/css" href="css/color/green.css" title="green">
    <link rel="stylesheet" type="text/css" href="css/color/light-red.css" title="light-red">
    <link rel="stylesheet" type="text/css" href="css/color/blue.css" title="blue">
    <link rel="stylesheet" type="text/css" href="css/color/light-blue.css" title="light-blue">
    <link rel="stylesheet" type="text/css" href="css/color/yellow.css" title="yellow">
    <link rel="stylesheet" type="text/css" href="css/color/light-green.css" title="light-green">

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    
    
    <!-- Modernizer js -->
    <script src="js/modernizr.custom.js"></script>

    
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body class="index">
    
    
    <!-- Styleswitcher
================================================== -->
        <div class="colors-switcher">
            <a id="show-panel" class="hide-panel"><i class="fa fa-tint"></i></a>        
                <ul class="colors-list">
                    <li><a title="Light Red" onClick="setActiveStyleSheet('light-red'); return false;" class="light-red"></a></li>
                    <li><a title="Blue" class="blue" onClick="setActiveStyleSheet('blue'); return false;"></a></li>
                    <li class="no-margin"><a title="Light Blue" onClick="setActiveStyleSheet('light-blue'); return false;" class="light-blue"></a></li>
                    <li><a title="Green" class="green" onClick="setActiveStyleSheet('green'); return false;"></a></li>
                    
                    <li class="no-margin"><a title="light-green" class="light-green" onClick="setActiveStyleSheet('light-green'); return false;"></a></li>
                    <li><a title="Yellow" class="yellow" onClick="setActiveStyleSheet('yellow'); return false;"></a></li>
                    
                </ul>

        </div>  
<!-- Styleswitcher End
================================================== -->

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">Data De-Duplication</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                        </li>
                   
                   
                    
                 <li>
                        <a class="page-scroll" style="color:green"font-size:50px" href="StoredInfo.jsp">Data Stored Information</a>
                    </li>
                    <li>
                        <a class="page-scroll" style="color:green"font-size:50px" href="aowner.jsp">Data Owner Details</a>
                    </li>
                    <li>
                        <a class="page-scroll" style="color:green"font-size:50px" href="auser.jsp">User Details</a>
                    </li>
                    <li>
                        <a class="page-scroll" style="color:green"font-size:50px" href="Attackers.jsp">Attackers Details</a>
                    </li>
                    <li>
                     <li>
                        <a class="page-scroll" style="color:green"font-size:50px" href="INDEX.jsp">Logout</a>
                    </li>
                      </li>
                
                  
                    <!-- <li>
                        <a class="page-scroll" href="#pricing">Pricing</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#latest-news">Latest News</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#testimonial">Testimonials</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#partner">Partner</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact">Contact</a>
                    </li>
                </ul>
            </div>
            </nav>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    

 <main id="main">
  <style>
table, th, td {
  border:2px solid black;
  
 
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 80%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
}
</style>
 <main id="main">
  <style>
table, th, td {
  border:2px solid black;
  border-collapse: collapse;width:70;
  width:90;
}
</style>

    <!-- ======= Breadcrumbs ======= -->
    <br><br><br><br><br><br>
  <center>

 <div id="banner" class="container">
			<div class="title">
				<h2>ATTACKER DETAILS</h2>
				</br></br>
				<%
					String sql = "select * from attack";
							List<String> lt = DbConnection.getAttack(sql);
							Iterator<String> itr = lt.iterator();
				%>
				<table width="80%" border="1">
					<tr>
						<th style="color: GREEN;">Data File ID</th>
						<th style="color: GREEN;">Owner ID</th>
						<th style="color: GREEN;">User ID</th>
						<th style="color: GREEN;">IP Address</th>
						<th style="color: GREEN;">Date of Attacker</th>
					</tr>
					<%
						while(itr.hasNext()){
					%>
					<tr>
						<td><%=itr.next()%></td>
						<td><%=itr.next()%></td>
						<td><%=itr.next()%></td>
						<td><%=itr.next()%></td>
						<td><%=itr.next()%></td>
					</tr>
					<%
						}
					%>
				</table></center>
			</div>
		</div>

	</center>
    <!-- ======= Breadcrumbs ======= -->
     		
	
		

  </main><!-- End #main -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

			</center>
<br><br><br>
<!-- Clients Aside -->
    <section id="partner">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title text-center">
                        <h3>Our Honorable Partner</h3>
                        <p>Duis aute irure dolor in reprehenderit in voluptate</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="clients">
                    
                    <div class="col-md-12">
                        <img src="images/logos/themeforest.jpg" class="img-responsive" alt="...">
                    </div>
                    
                    <div class="col-md-12">
                        <img src="images/logos/creative-market.jpg" class="img-responsive" alt="...">
                    </div>
                    
                    <div class="col-md-12">
                        <img src="images/logos/designmodo.jpg" class="img-responsive" alt="...">
                    </div>
                    
                    <div class="col-md-12">
                        <img src="images/logos/creative-market.jpg" class="img-responsive" alt="...">
                    </div>
                    
                    <div class="col-md-12">
                        <img src="images/logos/microlancer.jpg" class="img-responsive" alt="...">
                    </div>
                    
                    <div class="col-md-12">
                        <img src="images/logos/themeforest.jpg" class="img-responsive" alt="...">
                    </div>
                    
                    <div class="col-md-12">
                        <img src="images/logos/microlancer.jpg" class="img-responsive" alt="...">
                    </div>
                    
                    <div class="col-md-12">
                        <img src="images/logos/designmodo.jpg" class="img-responsive" alt="...">
                    </div>
                    
                    <div class="col-md-12">
                        <img src="images/logos/creative-market.jpg" class="img-responsive" alt="...">
                    </div>
                    
                    <div class="col-md-12">
                        <img src="images/logos/designmodo.jpg" class="img-responsive" alt="...">
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
    
    
    
    

           <footer class="style-1">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-xs-12">
                        <span class="copyright">Copyright &copy; <a href="###">Network Data</a> 2024</span>
                    </div>
                    <div class="col-md-4 col-xs-12">
                        <div class="footer-social text-center">
                            <ul>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4 col-xs-12">
                        <div class="footer-link">
                            <ul class="pull-right">
                                <li><a href="#">Privacy Policy</a>
                                </li>
                                <li><a href="#">Terms of Use</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </section>


    <div id="loader">
        <div class="spinner">
            <div class="dot1"></div>
            <div class="dot2"></div>
        </div>
    </div>

    

    <!-- jQuery Version 2.1.1 -->
    <script src="js/jquery-2.1.1.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="asset/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.1.3.js"></script>
    <script src="js/classie.js"></script>
    <script src="js/count-to.js"></script>
    <script src="js/jquery.appear.js"></script>
    <script src="js/cbpAnimatedHeader.js"></script>
    <script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.fitvids.js"></script>
	<script src="js/styleswitcher.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/script.js"></script>

</body>

</html>
