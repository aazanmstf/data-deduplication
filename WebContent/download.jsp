<!DOCTYPE html>
<%@page import="java.sql.Connection"%>
<html lang="en">
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>About - Sailor Bootstrap Template</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Sailor
  * Template URL: https://bootstrapmade.com/sailor-free-bootstrap-theme/
  * Updated: Aug 07 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body class="about-page">

  <header id="header" class="header d-flex align-items-center sticky-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center">

      <a href="index.html" class="logo d-flex align-items-center me-auto">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/img/logo.png" alt=""> -->
        <h1 class="sitename">DATA DEDUPLICATION</h1>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
           <li><a href="#hero" class="active">Home</a></li>
          <li><a href="search.jsp">SEARCH DATA</a></li>
         <li><a href="apfiles.jsp">DOWNLOAD DATA</a></li>
           <li><a href="index.html">LOGOUT</a></li>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>

     
    </div>
  </header>

  <main class="main">
  <main id="main">
 <!--  <style>
<main id="main">
  <style>
table, th, td {
  border:2px solid black;
  
 
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
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
</style> -->
<!--  <main id="main">
  <style>
table, th, td {
  border:2px solid black;
  border-collapse: collapse;width:100;
  width:100;
}
</style> -->

    <!-- Page Title -->
    <div class="page-title light-background">
      <!-- <div class="container d-lg-flex justify-content-between align-items-center"> -->
     
        <nav class="breadcrumbs">
          <ol>
            
            
          </ol>
        </nav>
      </div>
    </div><!-- End Page Title -->
    <script>
    function validateForm() {
        var password = document.getElementsByName("password")[0].value;
        /* var confirmPassword = document.getElementsByName("cpassword")[0].value; */

        if (password !== confirmPassword) {
            alert("Passwords do not match.");
            return false; // Prevent form submission
        }

        var pincode = document.getElementById("HospitalPincode").value;
        if (pincode.length > 6) {
            alert("Pincode cannot be more than six digits.");
            return false; // Prevent form submission
        }

        return true; // Allow form submission
    }

    function validateMobileNumber(input) {
        var mobileNumber = input.value;
        
        if (mobileNumber.length > 10) {
            alert("Mobile number should not exceed 10 characters!");
            input.value = mobileNumber.slice(0, 10); // Truncate the input to 10 characters
        }
    }

    function validatePasswordStrength(input) {
        var password = input.value;

        // Define your password strength conditions
        var hasUpperCase = /[A-Z]/.test(password);
        var hasLowerCase = /[a-z]/.test(password);
        var hasDigit = /\d/.test(password);
        var hasSpecialChar = /[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]/.test(password);

        // Check if all conditions are met
        if (hasUpperCase && hasLowerCase && hasDigit && hasSpecialChar && password.length >= 8) {
            updatePasswordStrengthIcon('strong');
            input.setCustomValidity(""); // Reset the validation message
        } else if ((hasUpperCase || hasLowerCase || hasDigit || hasSpecialChar) && password.length >= 6) {
            updatePasswordStrengthIcon('medium');
            input.setCustomValidity("");
        } else {
            updatePasswordStrengthIcon('weak');
            input.setCustomValidity("Password must be at least 8 characters long and include uppercase, lowercase, digit, and special character.");
        }
    }

    function updatePasswordStrengthIcon(strength) {
        var iconElement = document.getElementById('passwordStrengthIcon');
        iconElement.innerHTML = ''; // Clear previous icons

        if (strength === 'weak') {
            iconElement.innerHTML = '\uD83D\uDD34'; // Unicode escape sequence for 🔴
            iconElement.style.color = 'red'; // Set the color
        } else if (strength === 'medium') {
            iconElement.innerHTML = '\uD83D\uDFE0'; // Unicode escape sequence for 🟠
            iconElement.style.color = 'orange'; // Set the color
        } else if (strength === 'strong') {
            iconElement.innerHTML = '\uD83D\uDFE2'; // Unicode escape sequence for 🟢
            iconElement.style.color = 'green'; // Set the color
        }
    }

    function validatePincode(input) {
        var pincode = input.value;
        
        if (pincode.length > 6) {
            alert("Pincode should not exceed 6 characters!");
            input.value = pincode.slice(0, 6); // Truncate the input to 6 characters
        }
    }
</script>
<!-- <style>
.download-table-container {
  max-width: 80%;
  margin: 40px auto;
  padding: 20px;
  background-color: #f9f9f9;
  border: 1px solid #ddd;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.download-table {
  width: 100%;
  border-collapse: separate;
  border-spacing: 0 10px;
}

.download-table thead th {
  background-color: #34C759;
  color: #fff;
  padding: 10px;
  text-align: left;
}

.download-table tbody tr {
  background-color: #fff;
  border-bottom: 1px solid #ddd;
}

.download-table tbody tr:hover {
  background-color: #f5f5f5;
}

.download-table td {
  padding: 10px;
  text-align: left;
}

.download-btn {
  background-color: #34C759;
  color: #fff;
  border: none;
  padding: 10px 20px;
  font-size: 16px;
  cursor: pointer;
}

.download-btn:hover {
  background-color: #3e8e41;
}

.download-btn i {
  margin-right: 10px;
}

</style>
  <style>  
        table{  
            border-collapse: collapse;  
            width: 100%;   
        }  
    th,td{  
        border: 2px solid green;   
        padding: 15px;  
    }  
               
    </style>   -->
    <!-- About 2 Section -->
  <section id="about-2" class="about-2 section">
  <div class="container" data-aos="fade-up">
   
      <div class="col-lg-5">
      
      </div>
      <div class="col-lg-7">
        <center>
  <h2>DOWNLOAD Data</h2>
				<%
					session = request.getSession(false);
					String fid = request.getParameter("fid");
				%>
				<form action="Down" method="post">
					<table style="width: 1200px; padding-left: 50px;">
						<thead>
							<tr>
								<th style="color: GREEN;">FILE ID</th>
								<th style="color: GREEN;">Private KEY1</th>
								<th style="color: GREEN;">Private KEY2</th>
								
								<th style="color: BLUE;">DOWNLOAD</th>
							</tr>
						</thead>
							<tr>
								<td><input type="text" name="fid" value="<%=fid%>" style="width: 70px;" /></td> 
								<%-- <td><input type="text" name="fid" value="<%=fid%>" style="width: 50px;" /></td> --%>
								<td><input type="password" name="key1" style="width: 150px;"/></td>
								<td><input type="password" name="key2" style="width: 150px;" /></td>
								<td><input type="submit" value="Download" class="actions" /></td>
							</tr>
					</table>
					<br><br><br><br><br><br><br><br><br><br><br><br>
</div>
</div>

    </section><!-- /About 2 Section -->

  

         

          </div>

        </div>

      </div>

    </section><!-- /Skills Section -->

  </main>

  <footer id="footer" class="footer dark-background">

    <div class="container footer-top">
      <div class="row gy-4">
        <div class="col-lg-4 col-md-6 footer-about">
          <a href="index.html" class="logo d-flex align-items-center">
            <span class="sitename">DATA DEDUPLICATION</span>
          </a>
          <div class="footer-contact pt-3">
            <p>HYDERABAD</p>
            
            <p class="mt-3"><strong>Phone:</strong> <span>+91 9581022022</span></p>
            <p><strong>Email:</strong> <span>info@example.com</span></p>
          </div>
          <div class="social-links d-flex mt-4">
            <a href=""><i class="bi bi-twitter-x"></i></a>
            <a href=""><i class="bi bi-facebook"></i></a>
            <a href=""><i class="bi bi-instagram"></i></a>
            <a href=""><i class="bi bi-linkedin"></i></a>
          </div>
        </div>

        <div class="col-lg-2 col-md-3 footer-links">
          <h4>Useful Links</h4>
          <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">About us</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Terms of service</a></li>
            <li><a href="#">Privacy policy</a></li>
          </ul>
        </div>

        <div class="col-lg-2 col-md-3 footer-links">
          <h4>Our Services</h4>
          <ul>
            <li><a href="#">Web Design</a></li>
            <li><a href="#">Web Development</a></li>
            <li><a href="#">Product Management</a></li>
            <li><a href="#">Marketing</a></li>
            <li><a href="#">Graphic Design</a></li>
          </ul>
        </div>

      

      </div>
    </div>

    <div class="container copyright text-center mt-4">
      <p>© <span>Copyright</span> <strong class="px-1 sitename">JAVA</strong> <span>All Rights Reserved</span></p>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you've purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
        Designed by <a href="https://bootstrapmade.com/">AHMED</a>
      </div>
    </div>

  </footer>

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>