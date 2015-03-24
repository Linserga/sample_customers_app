'use strict';

angular.module('customersApp').factory('ordersFactory', ['$resource', function($resource){

	return $resource('/api/orders/:id', {id: "@id"});
}]);