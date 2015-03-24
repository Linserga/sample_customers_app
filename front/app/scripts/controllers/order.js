'use strict';

angular.module('customersApp').controller('OrderController', ['$scope', 'ordersFactory', '$routeParams', '$location', function($scope, ordersFactory, $routeParams, $location){
	
	var customerId = $routeParams.id;

	$scope.orders = ordersFactory.query({id: customerId });

}]);
