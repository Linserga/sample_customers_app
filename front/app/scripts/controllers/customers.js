'use strict';

angular.module('customersApp').controller('CustomersController', ['$scope', 'customersFactory', '$location', function ($scope, customersFactory, $location) {

    $scope.customers = customersFactory.query();

    $scope.wordOrder = 'name';

    $scope.doSort = function (item){
    	$scope.wordOrder = item;
    	$scope.reverse = !$scope.reverse;
    };

    $scope.show = function (id){
    	$location.url('/customer/' + id);
    };

    $scope.edit = function (id){
        $location.url('/customer/' + id + "/edit");
    };

    $scope.delete = function (customer){
		for( var i = 0; i < $scope.customers.length; i++){
            if($scope.customers[i].id === customer.id){
                $scope.customers.splice(i, 1);
                break;
            }
        }            
        
        customer.$delete();			
	};
 }]);
