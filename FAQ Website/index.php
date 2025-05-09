<?php
include('db_connect.php');
$result = $conn->query("SELECT * FROM categories");
?>

<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
		<link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/css/linearicons.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link rel="stylesheet" href="assets/css/slick.css">
		<link rel="stylesheet" href="assets/css/slick-theme.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/bootsnav.css" >	
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/responsive.css">

		

		<title>DBL FAQ</title>
    </head>
	
	<body>

		<!-- Navbar Area -->
		<section class="top-area">
			<div class="header-area">
				<!-- Start Navigation -->
			    <nav class="navbar navbar-default bootsnav  navbar-sticky navbar-scrollspy"  data-minus-value-desktop="70" data-minus-value-mobile="55" data-speed="1000">
			        <div class="container">
			            <!-- Start Header Navigation -->
			            <div class="navbar-header">
			                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
			                    <i class="fa fa-bars"></i>
			                </button>               
			            </div>

			            <!-- Links and others-->
			            <div class="collapse navbar-collapse menu-ui-design" id="navbar-menu">
			                <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
			                    <li><a href="index.php">home</a></li>
			                    <li><a href="">contact</a></li>
								<li><a href="https://cportal.dhakabank.com.bd/">Portal</a></li>	
								<li><a href="dashboard.php">Admin View</a></li>
			                </ul>
							<a href="index.php">
							<img src="./assets/images/welcome-hero/logo.png" alt="logo" data-in="fadeInDown" data-out="fadeOutUp">
							</a>

			            </div>
			        </div>
			    </nav>
			</div>

		</section>

		<!--Main Body (Intro Para) -->
		<section id="home" class="welcome-hero">
			<div class="container">
				<div class="welcome-hero-txt">
					<h2> Frequently Asked Questions</h2>
					<p> Discover categories that interests you </p>
					<h2 style="position: relative; font-size: 28px; text-align: center; margin-top: 50px; color: #505866">Select your category</h2>
				</div>
			</div>

		</section>

		<!--works start -->
		<section id="works" class="works">
    		<div class="container">
        		<div class="section-header">
            		<!--<h2>Select your category</h2>-->
            		<div class="container">
                		<div class="list-topics-content">
                    		<ul>
                        		<?php while ($row = mysqli_fetch_assoc($result)): ?>
                            		<?php 
                                		$imagePath = "./assets/images/iconss/" . $row['category_id'] . ".png"; 
                                		$defaultImage = "./assets/images/iconss/default.png"; 
                            		?>
                            		<li>
                                		<div class="single-list-topics-content">
                                    		<div class="single-list-topics-icon">
                                        		<img src="<?= file_exists($imagePath) ? $imagePath : $defaultImage ?>" width="30%">
                                    		</div>
                                    		<h2>
                                        		<a href="faq.php?category_id=<?= $row['category_id'] ?>">
                                            		<?= htmlspecialchars($row['category_name']) ?>
                                        		</a>
                                    		</h2>
                                		</div>
                            		</li>
                        		<?php endwhile; ?>
                    		</ul>
                		</div>
            		</div><!--/.container-->
        		</div>
    		</div>
		</section><!--/.works-->



		<!--footer-->
		<footer id="footer"  class="footer">
			<div class="container">
				<div class="footer-menu">
		           	<div class="row">
			           	<div class="col-sm-3">
			           		 <div class="navbar-header">
				                <a class="navbar-brand" href="index.php">DHAKA <span>BANK</span></a>
				            </div>
			           	</div>
			           	<div class="col-sm-9">
			           		<ul class="footer-menu-item">
			                    <li class=" scroll"><a href="#contact">my account</a></li>
			                </ul>
			           	</div>
		           </div>
				</div>
				<div class="hm-footer-copyright">
					<div class="row">
						<div class="col-sm-5">
							<p>
								&copy;copyright
							</p>
						</div>
					</div>
					
				</div>
			</div>

			<div id="scroll-Top">
				<div class="return-to-top">
					<i class="fa fa-angle-up " id="scroll-top" data-toggle="tooltip" data-placement="top" title="" data-original-title="Back to Top" aria-hidden="true"></i>
				</div>
				
			</div>
			
        </footer>
		
		<!--scripts-->
		
		<script src="assets/js/jquery.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/bootsnav.js"></script>
        <script  src="assets/js/feather.min.js"></script>
		<script src="assets/js/jquery.counterup.min.js"></script>
		<script src="assets/js/waypoints.min.js"></script>
        <script src="assets/js/slick.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <script src="assets/js/custom.js"></script>
		<script src="./assets/js/script.js"></script>
        
    </body>
	
</html>