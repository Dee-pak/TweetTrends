<!DOCTYPE html>
<html>
  <head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="<c:url value="/resources/js/angular.js" />"></script>
<script src="<c:url value="/resources/js/trendController.js" />"></script>
<title>Contact</title>
    <style>
       #map {
        height: 400px;
        width: 100%;
       }
       
    html {
      position: relative;
      min-height: 100%;
    }
    body {
      /* Margin bottom by footer height */
      margin-bottom: 60px;
    }
    .footer {
      position: absolute;
      bottom: 20;
      width: 100%;
      /* Set the fixed height of the footer here */
      height: 150px;
      background-color: #f5f5f5;
      background: #00a3e8;
    }
    .footer-basic-centered{
	box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.12);
	box-sizing: border-box;
	width: 100%;
	text-align: center;
	font: normal 18px sans-serif;
	padding: 45px;
	margin-top: 80px;
}

.footer-basic-centered .footer-company-motto{
	color:  #ffffff;
	font-size: 24px;
	margin: 0;
}

.footer-basic-centered .footer-company-name{
	color:  #000000;
	font-size: 14px;
	margin: 0;
}

.footer-basic-centered .footer-links{
	list-style: none;
	font-weight: bold;
	color:  #ffffff;
	padding: 35px 0 23px;
	margin: 0;
}

.footer-basic-centered .footer-links a{
	display:inline-block;
	text-decoration: none;
	color: inherit;
}
    </style>
    <title>Contact Us</title>
  </head>
  <body>
      <!-- Header Start -->
        <div class="page-header">
            <h1 style="color: #00a3e8;margin-left: 60;">Tweets & Trends <small>see what is trending anywhere in the World!</small></h1>
        </div>
    <!-- Header end -->
    
        <!-- Navbar start -->
	<div class="container">
		<nav class="navbar navbar-inverse" >
			<div class="navbar-header">
				<a style="color: #00a3e8;" class="navbar-brand" href="/edu">Home </a> 
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a style="color: #00a3e8;margin-right: 20;" href="contactus"><span
						class="glyphicon glyphicon-edit"></span>Contact Us</a></li>
			</ul>
		</nav>
	</div>
    
    <!-- Navbar end -->
    
    <h3>Northeastern University</h3>
    <div id="map"></div>
    <script>
      function initMap() {
        var uluru = {lat: 42.3398067, lng: -71.0913604};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 16,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBwaQxUBv8pI7-zSCt9ExXRSDUfSO_YPDk&callback=initMap">
    </script>
    
    <footer class="footer-basic-centered footer">
	<p class="footer-company-motto">See what's trending</p>
	<p class="footer-links">
            <a href="/edu">Home</a>
							·
            <a href="contactus">Contact</a>
                                                        ·
            <a href="https://github.com/Dee-pak/TweetTrends" target="_blank">Github</a>
	</p>
    <p class="footer-company-name">Tweets & Trends &copy; 2017</p>

    </footer>
  </body>
</html>