'use strict';

angular.module('customersApp').directive('navbar', function(){
	return {
		restrict: 'E',
		templateUrl: 'views/partials/nav.html',
		replace: true,
		controller: 'NavigationController'
	};
});