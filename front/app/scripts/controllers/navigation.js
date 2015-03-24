'use strict';

angular.module('customersApp').controller('NavigationController', ['$scope', function($scope){

	$scope.selectedTab = 1;

	$scope.selectTab = function (tab){
		$scope.selectedTab = tab;
	}

	$scope.isSelected = function (tab){
		return $scope.selectedTab === tab;
	}
}]);