<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>RideEase</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
</head>

<body>

  <header id="header" class="fixed-top d-flex align-items-center header-transparent">
    <div class="container d-flex align-items-center justify-content-between">

      <div class="logo">
        <h1><a href="index.html"><span>RideEase</span></a></h1>
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
          <li><a class="nav-link scrollto" href="#about">Sign up as Customer</a></li>
          <li><a class="nav-link scrollto" href="#driver">Sign up as Captain</a></li>
          <li><a class="nav-link scrollto disabled" href="#team">Team</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero">

    <div class="container">
      <div class="row justify-content-between">
        <div class="col-lg-7 pt-5 pt-lg-0 order-2 order-lg-1 d-flex align-items-center">
          <div data-aos="zoom-out">
            <h1>Welcome to <span>RideEase</span></h1>
            <h2>An Online Ride Booking System with the Lowest Fare rate.</h2>
            <div class="text-center text-lg-start">
              <a href="#about" class="btn-get-started scrollto">Sign Up as Customer</a>
              <a href="#driver" class="btn-get-started2 scrollto">Sign Up as Captain</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 order-1 order-lg-2 hero-img" data-aos="zoom-out" data-aos-delay="300">
          <img src="assets/img/hero-img.png" class="img-fluid animated" alt="">
        </div>
      </div>
    </div>

    <svg class="hero-waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 24 150 28 " preserveAspectRatio="none">
      <defs>
        <path id="wave-path" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z">
      </defs>
      <g class="wave1">
        <use xlink:href="#wave-path" x="50" y="3" fill="rgba(255,255,255, .1)">
      </g>
      <g class="wave2">
		  <use xlink:href="#wave-path" x="50" y="0" fill="rgba(255,255,255, .2)"></use>
      </g>
      <g class="wave3">
		  <use xlink:href="#wave-path" x="50" y="9" fill="#fff"></use>
      </g>
    </svg>

  </section><!-- End Hero -->

  <main id="main" class="mb-5">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container-fluid">

        <div class="row">
          <div class="col-xl-5 col-lg-6 video-box d-flex justify-content-center align-items-stretch" data-aos="fade-right">
          </div>

          <div class="col-xl-7 col-lg-6 icon-boxes d-flex flex-column align-items-stretch justify-content-center py-5 px-lg-5" data-aos="fade-left">
            <h3>Sign up as Customer</h3>
            <p>Join us as a customer and travel around the city in a comfortable ride at a lowest fare rate.</p>

            <form action="CustReg.jsp" method="post">


     <div class="form-group row mt-3">
      <div class="col-sm-5">
       <input type="text" class="form-control" name="FirstName"
        placeholder="First name">
      </div>
		 <div class="col-sm-5">
       <input type="text" class="form-control" name="LastName"
        placeholder="Last Name">
      </div>
     </div>

     <div class="form-group row mt-3">
      <div class="col-sm-5">
       <input type="text" class="form-control" name="Email"
        placeholder="Email Address">
      </div>
		 <div class="col-sm-5">
       <input type="number" class="form-control no-spin" name="Phone"
        placeholder="Phone"  maxlength="10" pattern="\d{10}">
      </div>
     </div>
     
     <div class="form-group row mt-3">
      <div class="col-sm-5">
       <input type="password" class="form-control" name="Pass"
        placeholder="New Password">
      </div>
		 <div class="col-sm-5">
       <input type="password" class="form-control" placeholder="Confirm Password">
      </div>
     </div>
     
     <div class="form-group row mt-3">
      <div class="col-12">
       <div class="form-check">
  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
  <label class="form-check-label" for="flexCheckDefault">
   I Agree to Terms & Conditions.
  </label>
</div>
      </div>
     </div>

     <div class="row justify-content-center mt-3">
	 <div class="col-5">
     <button type="submit" class="btn col-sm-10 p-2 mt-2" style="background-color: #010592; color: #FFF; margin-left: -15px;">Sign up</button>
     </div>
     </div>
				
	<div class="col-11 mt-4">
		<center>
	<label>Already have an account? <a href="CustLogin.jsp">Login Here!</a></label>	
		</center>
	</div>
     
    </form>

          </div>
        </div>

      </div>
    </section><!-- End About Section -->

   <!-- ======= About Section ======= -->
    <section id="driver" class="about">
      <div class="container-fluid row" style="margin-top: -50px;">

          <div class="col-lg-6 icon-boxes d-flex flex-column align-items-stretch justify-content-center py-5 px-lg-5" data-aos="fade-left">
            <h3>Sign up as Captain</h3>
            <p>Join us as a Captain and earn with us, with a secure payment method.</p>

            <form action="DriverReg.jsp" method="post">

	 <label>Personal Information<label style="color: red">*</label></label>
     <div class="form-group row mt-3">
      <div class="col-sm-5">
       <input type="text" class="form-control" name="FirstName"
        placeholder="First name">
      </div>
		 <div class="col-sm-5">
       <input type="text" class="form-control" name="LastName"
        placeholder="Last Name">
      </div>
     </div>

     <div class="form-group row mt-3">
      <div class="col-sm-5">
       <input type="number" class="form-control no-spin" name="Phone"
        placeholder="Phone"  maxlength="10" pattern="\d{10}">
      </div>
		 <div class="col-sm-5">
       <input type="password" class="form-control" name="Pass"
        placeholder="New Password">
      </div>
     </div>
     
     <div class="form-group row mt-3">
      <div class="col-sm-5">
       <input type="number" class="form-control no-spin" name="DLC"
        placeholder="Driving License">
      </div>
		 <div class="col-sm-5">
       <input type="password" class="form-control" name=""
        placeholder="Confirm Password">
      </div>
     </div>
				
				
	 <label class="mt-3">Vehicle Information<label style="color: red">*</label></label>
	 <div class="form-group row mt-3">
      <div class="col-sm-6">
       <input type="text" class="form-control no-spin" name="CarMake"
        placeholder="Vehicle Make">
      </div>
		 <div class="col-sm-6">
       <input type="text" class="form-control" name="CarName"
        placeholder="Vehicle Name">
      </div>
     </div>
	<div class="form-group row mt-3">
      <div class="col-sm-6">
       <input type="text" class="form-control no-spin" name="CarVar"
        placeholder="Vehicle Variant">
      </div>
		 <div class="col-sm-6">
       <input type="number" class="form-control" name="CarModel"
        placeholder="Vehicle Model">
      </div>
     </div>
	<div class="form-group row mt-3">
      <div class="col-sm-6">
       <input type="text" class="form-control no-spin" name="CarColor"
        placeholder="Vehicle Color">
      </div>
		 <div class="col-sm-6">
       <input type="number" class="form-control" name="CarReg"
        placeholder="Vehicle Registration">
      </div>
     </div>
     
     <div class="form-group row mt-3">
      <div class="col-12">
       <div class="form-check">
  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault2">
  <label class="form-check-label" for="flexCheckDefault">
   I Agree to Terms & Conditions.
  </label>
</div>
      </div>
     </div>

     <div class="row justify-content-center mt-3">
	 <div class="col-5">
     <button type="submit" class="btn col-sm-12 p-2 mt-2" style="background-color: #010592; color: #FFF; margin-left: -25px;">Sign up</button>
     </div>
     </div>
				
	<div class="col-11 mt-4">
		<center>
	<label>Already have an account? <a href="DriverLogin.jsp">Login Here!</a></label>	
		</center>
	</div>
     
    </form>
          </div>
		  <div class="col-lg-6 video-boxx d-flex align-items-stretch" data-aos="fade-right"></div>

      </div>
		
    </section><!-- End About Section -->


   
  </main><!-- End #main -->

    <!-- ======= Footer ======= -->
  <footer id="footer">
   

    <div class="container">
      <div class="copyright">
        All Rights Reserved &copy;
      </div>
      <div class="credits">
        Developed by <strong><a href="https://bootstrapmade.com/">Muhammad Shujaat Ali</a></strong> 
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>