'use strict';

angular.module('customersApp').controller('NewController', ['$scope','customersFactory', '$location', function($scope, customersFactory, $location){

	$scope.customer = new customersFactory({
			customer: {
				name: '',
				city: '',
			}
		});

	$scope.createCustomer = function(form){
		$scope.customer.$save();
		$scope.customer = {};
		form.$setPristine();	
		$location.url('/');			
	};
}]);