'use strict';

angular.module('customersApp').controller('EditController', ['$scope', 'customersFactory', '$routeParams', '$location', function($scope, customersFactory, $routeParams, $location){

	var customerId = $routeParams.id;

	$scope.customer = customersFactory.get({id: customerId});

	$scope.editCustomer = function(){
		$scope.customer.$update();
		$scope.customer = {};
		$location.url("/");
	};
}]);