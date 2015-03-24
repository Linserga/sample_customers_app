'use strict';

angular.module('customersApp', ['ngResource', 'ngRoute', 'ngMessages'])
  .config(function($routeProvider){
      $routeProvider
        .when('/', {
          templateUrl: 'views/customers.html',
          controller: 'CustomersController'
        })
        .when('/customer/:id', {
          templateUrl: 'views/order.html',
          controller: 'OrderController'
        })
        .when('/customers/new', {
          templateUrl: 'views/new.html',
          controller: 'NewController'
        })
        .when('/customer/:id/edit', {
          templateUrl: 'views/edit.html',
          controller: 'EditController'
        })
        .when('/allOrders', {
          templateUrl: 'views/allOrders.html',
          controller: 'AllOrdersController'
        })
        .otherwise({redirectTo: '/'});
  });
