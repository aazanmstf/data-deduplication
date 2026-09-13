<!DOCTYPE html>
<html lang="en">

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
          <!-- <li class="dropdown"><a href="###"><span>DATA MANAGER</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
            <ul>
              <li><a href="owner.jsp">REGISTER</a></li>
              <li><a href="####">LOGIN</a></li>
           
            </ul>
          </li> 
          <li><a href="LoginCSP.jsp">PROXY DATA CENTER</a></li>
           <li class="dropdown"><a href="about.html"><span>USER</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
            <ul>
              <li><a href="Register.jsp">REGISTER</a></li>
              <li><a href="###">LOGIN</a></li>
              </ul> -->
          </li> 
          <li><a href="upload.jsp">UPLOAD DATA</a></li>
         <!--  <li><a href="LoginCSP.jsp">PROXY DATA CENTER</a></li> -->
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
   <style>
   .container {
  max-width: 1200px;
  margin: 40px auto;
  padding: 20px;
  background-color: #f9f9f9;
  border: 1px solid #ddd;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.file-upload-table {
  width: 100%;
  border-collapse: collapse;
}

.file-upload-table th {
  background-color: #f0f0f0;
  color: #333;
  padding: 10px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

.file-upload-table td {
  padding: 10px;
  border-bottom: 1px solid #ddd;
}

.form-input {
  width: 100%;
  padding: 10px;
  margin: 10px 0;
  border: 1px solid #ccc;
}

.button-alt {
  background-color: #4CAF50;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.button-alt:hover {
  background-color: #3e8e41;
}
   
   
   
   </style>
   <script>
// Add event listener to the file input field
   document.querySelector('input[type="file"]').addEventListener('change', function() {
     var fileName = this.value.split('\\').pop();
     document.querySelector('input[name="fname"]').value = fileName;
   });
   
   
   
   </script>
<script>
  document.addEventListener('DOMContentLoaded', function () {
    const fileInput = document.querySelector('input[name="file"]');
    const fnameInput = document.querySelector('input[name="fname"]');

    fileInput.addEventListener('change', function () {
      if (fileInput.files.length > 0) {
        const fullPath = fileInput.files[0].name;
        fnameInput.value = fullPath;
      }
    });

    // Make the fname field readonly
    fnameInput.readOnly = true;
  });
</script>
    <!-- About 2 Section -->
  <section id="about-2" class="about-2 section">
  <div class="container" data-aos="fade-up">
    <div class="row g-4 g-lg-5" data-aos="fade-up" data-aos-delay="200">
      <div class="col-lg-5">
        <div class="about-img">
          <img src="assets/img/about-portrait.jpg" class="img-fluid" alt="">
        </div>
      </div>
      <div class="col-lg-7">
       
     <div class="container">
  <%
  String error=(String)request.getAttribute("error");%>
  <p><%=error%></p>
  <form action="Upload" method="post" enctype="multipart/form-data">
    <table class="file-upload-table">
      <thead>
        <tr>
          <th>FILE NAME</th>
          <th>DESCRIPTION</th>
          <th>FILE</th>
          <th>UPLOAD</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><input type="text" name="fname" class="form-input" readonly /></td>
          <td><input type="text" name="fdes" class="form-input" /></td>
          <td><input type="file" name="file" class="form-input" /></td>
          <td><input type="submit" value="Upload" class="button-alt" /></td>
        </tr>
      </tbody>
    </table>
  </form>
</div>

            </div>

          </div>

        </div>

      </div>

    </section><!-- /About 2 Section -->

  

        <!--   <

          </div>

        </div>

      </div>

    </section>/Skills Section

  </main> -->

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