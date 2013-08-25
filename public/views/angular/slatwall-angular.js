angular.module('SlatwallScope', function() {
	return {
		$get : function(){
			return {
				items: [5,6,7]
			};
		}
	};
});

var slatwall = angular.module('slatwall', ['SlatwallScope']);

slatwall.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
	
		$routeProvider.when('/product/:urlTitle', {
			templateUrl: '?slatAction=public:angular.product',
			controller: 'ProductController'
		});
		$routeProvider.when('/productlist', {
			templateUrl: '?slatAction=public:angular.productlist',
			controller: 'ProductListController'
		});
		$routeProvider.otherwise({redirectTo: '/productlist'});
		
		// configure html5 to get links working on jsfiddle
		$locationProvider.html5Mode(true);
	}
]);



slatwall.controller('MainController', function($route, $routeParams, $location, $scope){
	
	$scope.$route = $route;
	$scope.$location = $location;
	$scope.$routeParams = $routeParams;
	
	
});

slatwall.controller('ProductListController', function($scope){
	$scope.productList = [
	                   {urlTitle:'air-jordan', productName:'Air Jordan'},
	                   {urlTitle:'my-shoes', productName:'My Shoes'}
	                   ];
});

slatwall.controller('ProductController', function($scope, SlatwallScope){
	console.log(SlatwallScope);
	$scope.items = SlatwallScope.items;
});



/*
function MainCntl($route, $routeParams, $location) {
	  this.$route = $route;
	  this.$location = $location;
	  this.$routeParams = $routeParams;
	}
*/

/*
function MainCntl($route, $routeParams, $location) {
	  this.$route = $route;
	  this.$location = $location;
	  this.$routeParams = $routeParams;
	}
	 
	function BookCntl($routeParams) {
	  this.name = "BookCntl";
	  this.params = $routeParams;
	}
	 
	function ChapterCntl($routeParams) {
	  this.name = "ChapterCntl";
	  this.params = $routeParams;
	}


slatwall.controller('Product', function($scope){
	$scope.items = [1,2,3];
});


angular.module('ngViewExample', ['ngRoute', 'ngAnimate'], function($routeProvider, $locationProvider) {
	  $routeProvider.when('/Book/:bookId', {
	    templateUrl: 'book.html',
	    controller: BookCntl,
	    controllerAs: 'book'
	  });
	  $routeProvider.when('/Book/:bookId/ch/:chapterId', {
	    templateUrl: 'chapter.html',
	    controller: ChapterCntl,
	    controllerAs: 'chapter'
	  });
	 
	  // configure html5 to get links working on jsfiddle
	  $locationProvider.html5Mode(true);
	});
	 
	function MainCntl($route, $routeParams, $location) {
	  this.$route = $route;
	  this.$location = $location;
	  this.$routeParams = $routeParams;
	}
	 
	function BookCntl($routeParams) {
	  this.name = "BookCntl";
	  this.params = $routeParams;
	}
	 
	function ChapterCntl($routeParams) {
	  this.name = "ChapterCntl";
	  this.params = $routeParams;
	}

*/