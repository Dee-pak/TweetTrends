<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html ng-app="SearchTweet">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="<c:url value="/resources/js/angular.js" />"></script>
<script src="<c:url value="/resources/js/trendController.js" />"></script>
<title>Home</title>
</head>
<style>
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
<body ng-controller="searchTweetCtrl" style="background-color: #ffffff">
    
    <!-- Header Start -->
        <div class="page-header">
            <h1 style="color: #00a3e8;margin-left: 60;">Tweets & Trends <small>see what is trending anywhere in the World!</small></h1>
        </div>
    <!-- Header end -->
    
	<div class="container">
		<nav class="navbar navbar-inverse" >
			<div class="navbar-header">
				<a style="color: #00a3e8;" class="navbar-brand" href="/edu">Home </a> 
                                <a style="color: #00a3e8;" class="navbar-brand" ng-click="getTwitterTrends()" href="#">Get Trends</a> 
                                <a style="color: #00a3e8;" class="navbar-brand" ng-click="getSearchTweetBox()" href="#">Search Tweets</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a style="color: #00a3e8;margin-right: 10;" href="contactus"><span
						class="glyphicon glyphicon-edit"></span>Contact Us</a></li>
			</ul>
		</nav>
	</div>

	<div class="container" ng-show="showTweet">

		<div class="row">
		  <div class="col-sm-6">
		    <div class="input-group col-sm-6">
		      <input type="text" class="form-control" placeholder="Enter Tweet..." ng-model="inputString">
		      <span class="input-group-btn">
		        <button class="btn btn-default" type="button" value="Search" ng-click="search()">Go!</button>
		      </span>
		    </div><!-- /input-group -->
		    <br>
		    <div class="input-group">
			  <input type="text" class="form-control" placeholder="Filter tweets" aria-describedby="sizing-addon2" ng-model="filterTweet" />
			</div>
		  </div><!-- /.col-lg-6 -->
		</div>

		<br>

		<div class="row">
			</b>
			<div class="col-sm-4">
				<b>Sort Tweets: </b><select class="form-control selcls" ng-model="sortTweet">
					<option value="createdAt">Date</option>
					<option value="user.name">User Name</option>
					<option value="retweetCount">Tweet Count</option>
				</select>
			</div>
		</div>
		</b>
		<div class="row">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>User Name</th>
						<th>User Location</th>
						<th>User Pic</th>
						<th>Date</th>
						<th>Id</th>
						<th>Tweet</th>
						<th>Retweet Count</th>
					</tr>
				</thead>
				<tbody>
					<tr
						ng-repeat="tweet in tweets | filter:filterTweet | orderBy:sortTweet ">
						<td>{{tweet.user.name}}</td>
						<td>{{tweet.user.location}}</td>
						<td><img ng-src="{{tweet.user.profileImageUrl}}"
							alt="Description" /></td>
						<td>{{tweet.createdAt}}</td>
						<td>{{tweet.id}}</td>
						<td>{{tweet.text}}</td>
						<td>{{tweet.retweetCount}}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<div ng-show="showTrendsDiv" class="container col-sm-4" style="margin-left: 50" >
		Select Location:<select class="form-control selcls" ng-model="trendlist"
			ng-options="trend.name for trend in trends | orderBy:'name'">
                </select><br>
                <input class="btn btn-primary" type="button" ng-click="gettrendsbylocation()"
			value="Find Trends" />
		<div class="container">
			<div class="row">
				<div class="table-responsive">
					<table class="table table-striped table-hover ">
						<thead>
							<tr>
								<th>Trend Tag</th>
							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="countryTrend in countryTrends">
								<td><a href="{{countryTrend.url}}" target="_blank">{{countryTrend.name}}</a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
    
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