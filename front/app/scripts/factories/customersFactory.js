'use strict';

angular.module('customersApp').factory('customersFactory', ['$resource', function($resource){
	return $resource('api/customers/:id', { id: '@id'}, {'update': { method:'PUT' }}); 
}]);