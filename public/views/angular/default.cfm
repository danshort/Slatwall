<!doctype html>
<html ng-app="slatwall">
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js"></script>
		<script src="/public/views/angular/slatwall-angular.js"></script>
	</head>
	<body ng-controller="MainController">
		<div>
			<ul>
				<li ng-repeat="product in products"><a ng-href="/product/{{product.urlTitle}}">{{product.productName}}</a></li>
			</ul>
			<div ng-view></div>
			<!---
			<label>Name:</label>
			<input type="text" ng-model="yourName" placeholder="Enter a name here">
			<hr>
			<h1>Hello {{yourName}}!</h1>
			--->
			<pre>$location.path() = {{$location.path()}}</pre>
			<pre>$route.current.templateUrl = {{$route.current.templateUrl}}</pre>
		    <pre>$route.current.params = {{$route.current.params}}</pre>
		    <pre>$route.current.scope.name = {{$route.current.scope.name}}</pre>
			<pre>$routeParams = {{$routeParams}}</pre>
		</div>
	</body>
</html>
<!---

	public void function product( required struct rc ) {
		param name="rc.productID" type="string" default="";
			
		var product = getProductService().getProduct(rc.productID);
		
		if(!isNull(product)) {
			rc.ajaxResponse["product"] = product;	
		}
	}
	
	public void function productList( required struct rc ) {
		
	}
	
	public void function cart( required struct rc ) {
		
	}
	
	public void function account( ) {
		
	}
	
	private struct function getSmartListResponse( required any smartList ) {
		var response = {};
		response[ "recordsCount" ] = smartList.getRecordsCount();
		response[ "pageRecordsCount" ] = arrayLen(smartList.getPageRecords());
		response[ "pageRecordsShow"] = smartList.getPageRecordsShow();
		response[ "pageRecordsStart" ] = smartList.getPageRecordsStart();
		response[ "pageRecordsEnd" ] = smartList.getPageRecordsEnd();
		response[ "currentPage" ] = smartList.getCurrentPage();
		response[ "totalPages" ] = smartList.getTotalPages();
		response[ "savedStateID" ] = smartList.getSavedStateID();
		response[ "pageRecords" ] = [];
		
		var smartListPageRecords = smartList.getPageRecords();
		for(var i=1; i<=arrayLen(smartListPageRecords); i++) {
			var thisRecord = {};
			for(var p=1; p<=arrayLen(piArray); p++) {
				var value = smartListPageRecords[i].getValueByPropertyIdentifier( propertyIdentifier=piArray[p], formatValue=true );
				if((len(value) == 3 and value eq "YES") or (len(value) == 2 and value eq "NO")) {
					thisRecord[ piArray[p] ] = value & " ";
				} else {
					thisRecord[ piArray[p] ] = value;
				}
			}
			arrayAppend(rc.response[ "pageRecords" ], thisRecord);
		}
	}
--->