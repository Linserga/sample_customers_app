'use strict';

angular.module('customersApp').controller('AllOrdersController', ['$scope', 'ordersFactory', function($scope, ordersFactory){

	$scope.orders = ordersFactory.query();

	$scope.countOrders = function (){
		var total = 0;
		for (var i = 0; i < $scope.orders.length; i++){
			total += $scope.orders[i].price;
		}				
		$scope.totalClass = (total > 100) ? 'success' : 'danger';
		return total;		
	};
}]);