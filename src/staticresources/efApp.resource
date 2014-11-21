var eventFlex = angular.module('eventflex', ['ngRoute', 'ngAnimate', 'gantt', 'angularCharts']);

// configure our routes
eventFlex.config(function($routeProvider) {
    $routeProvider

      // route for the home page
      .when('/', {
        templateUrl : staticItems['efMainHTML'],
        controller  : 'MainCTRL'
      })

      // route for the about page
      .when('/session/:id', {
        templateUrl :  staticItems['efSessionHTML'],
        controller  : 'SessionCTRL'
      })

      .when('/session/m/:id', {
        templateUrl :  staticItems['efSessionModalHTML'],
        controller  : 'SessionModalCTRL'
      })

      .when('/analytics/:id', {
        templateUrl :  staticItems['efAnalyticsHTML'],
        controller  : 'AnalyticsCTRL'
      })
  });