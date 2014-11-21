// Main App
var d3App = angular.module('d3App', ['ngRoute', 'angularCharts']);

d3App.service('chartServices', function(){
         return{

getDashboardForEvent : function(eventId, callback){
                 Visualforce.remoting.Manager.invokeAction(staticItems['getDashboardForEvent'],'a012000001eEKmv	', function(result, event){
                    if( event.status ) {
                        callback(result);
                    }
                });
            }
        }
    });


// Main Controller
d3App.controller('d3CTRL', function($scope, chartServices, $routeParams) {
    
    $scope.eventId = $routeParams.id;

    $scope.charts = [];

    $scope.config = {
    title: 'Products',
    tooltips: true,
    labels: false,
    mouseover: function() {},
    mouseout: function() {},
    click: function() {},
    legend: {
      display: true,
      //could be 'left, right'
      position: 'right'
    }
  };

  $scope.init = function(){
  	chartServices.getDashboardForEvent($scope.eventId, function(results){
  		
      $scope.data = results.efReports[0];
  		$scope.$apply($scope.data);

      console.debug($scope.data);
  	});
  }

  $scope.init();

/*
  $scope.data = {
    series: ['Sales', 'Income', 'Expense', 'Laptops', 'Keyboards'],
    data: [{
      x: "Laptops",
      y: [100, 500, 0],
      tooltip: "this is tooltip"
    }, {
      x: "Desktops",
      y: [300, 100, 100]
    }, {
      x: "Mobiles",
      y: [351]
    }, {
      x: "Tablets",
      y: [54, 0, 879]
    }]
  };
*/
       
});
