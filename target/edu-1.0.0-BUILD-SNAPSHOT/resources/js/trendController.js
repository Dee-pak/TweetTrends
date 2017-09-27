/**
 * 
 */

var app = angular.module("SearchTweet", []);
app.controller("searchTweetCtrl", function($scope, $http) {

	$scope.showTrendsDiv = false;
	$scope.showTweet = false;

	$scope.trends = [];
	$scope.getTwitterTrends = function() {
		$scope.showTrendsDiv = true;
		$scope.showTweet = false;
		$http.get('twittertrends').success(function(data) {
			$scope.trends = data;
		}).error(function(data) {
			alert('error');
		})
	};

	$scope.gettrendsbylocation = function() {
		if ($scope.trendlist == undefined) {
			alert('Please Select Location from the List');
		} else {
			$http.get('gettrendsbycountry', {
				params : {
					"woeid" : $scope.trendlist.woeid
				}
			}).success(function(data) {
				$scope.countryTrends = data;
			}).error(function(data) {

			});

		}
	};

	$scope.getSearchTweetBox = function() {
		$scope.showTrendsDiv = false;
		$scope.showTweet = true;
	};

	$scope.search = function() {
		if($scope.inputString==null || $scope.inputString==undefined || $scope.inputString==""){
			alert('Kindly Enter Value in search box');
		}else{
			$http.get('loadtweets', {
				params : {
					"searchTweets" : $scope.inputString
				}
			}).success(function(data) {
				$scope.tweets = data;
			});
		};	
			
		}
		
});