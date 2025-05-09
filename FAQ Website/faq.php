<?php

include('db_connect.php');
$category_id = isset($_GET['category_id']) ? intval($_GET['category_id']) : 0;

// Fetch category name
$category_stmt = $conn->prepare("SELECT category_name FROM categories WHERE category_id = ?");
$category_stmt->bind_param("i", $category_id);
$category_stmt->execute();
$category_result = $category_stmt->get_result();
$category = $category_result->fetch_assoc();

if (!$category) {
    echo "<h2>Category not found</h2>";
    exit;
}

// Fetch questions and answers for the selected category
$faq_stmt = $conn->prepare("
        SELECT q.question_id, q.question, a.answer
        FROM questions q
        JOIN answers a ON q.question_id = a.question_id
        WHERE q.category_id = ?
");
$faq_stmt->bind_param("i", $category_id);
$faq_stmt->execute();
$faq_result = $faq_stmt->get_result();
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

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <title><?= htmlspecialchars($category['category_name']) ?></title>
    <script>
        function toggleAnswer(id) {
            var answer = document.getElementById("answer-" + id);
            answer.style.display = answer.style.display === "none" ? "block" : "none";
        }
    </script>
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
							<li><a href="test.php">Admin View</a></li>
		                </ul>
						<a href="index.php">
							<img src="./assets/images/welcome-hero/logo.png" alt="logo" data-in="fadeInDown" data-out="fadeOutUp">
						</a>
						
		            </div>
		        </div>
		    </nav>
		</div>
	    <div class="clearfix"></div>
	</section>

    <!--Main Body (Intro Para) -->
	<section id="home" class="welcome-hero">
		<div class="container">
			<div class="welcome-hero-txt">
                <h2><?= htmlspecialchars($category['category_name']) ?></h2>
			</div>
		</div>
	</section>
    



	<div class="wrapper">
    	<?php while ($row = $faq_result->fetch_assoc()): ?>
    	    <div class="faq">
    	        <button class="accordion">
    	            <?= htmlspecialchars($row['question']) ?>
    	            <i class="fa-solid fa-chevron-down"></i>
    	        </button>
    	        <div class="pannel">
    	            <p><?= htmlspecialchars($row['answer'] ?? "No answer available.") ?></p>
    	        </div>
    	    </div>
    	<?php endwhile; ?>
	</div>


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

	<script>
		var acc = document.getElementsByClassName("accordion");
      	var i;

      	for (i = 0; i < acc.length; i++) {
        	acc[i].addEventListener("click", function () {
        	this.classList.toggle("active");
        	this.parentElement.classList.toggle("active");
        	var pannel = this.nextElementSibling;

        	if (pannel.style.display === "block") {
				pannel.style.display = "none";
        	} 
			
			else {
        	    pannel.style.display = "block";
        	}

        	});
      	}
    </script>
	
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
