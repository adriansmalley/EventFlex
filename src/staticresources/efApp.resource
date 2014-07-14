var eventFlex = angular.module('eventflex', ['ngRoute', 'ngAnimate']);

// configure our routes
eventFlex.config(function($routeProvider) {
    $routeProvider

      // route for the home page
      .when('/', {
        templateUrl : '/resource/1405332906000/efMainHTML',
        controller  : 'MainCTRL'
      })

      // route for the about page
      .when('/session/:id', {
        templateUrl : '/resource/1405341529000/efSessionHTML',
        controller  : 'SessionCTRL'
      })

      // route for the contact page
      .when('/contact', {
        templateUrl : 'pages/contact.html',
        controller  : 'contactController'
      });
  });