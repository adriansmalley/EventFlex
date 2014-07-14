eventFlex.controller('MainCTRL', function($scope, efSERVICES, $routeParams) {
  $scope.toSession = '12345';
  $scope.test = '¡Hola!';
  $scope.events = [];
  $scope.isLoading = false;

  $scope.loadData = function(){
    if($scope.events.length > 0){
      
      return;
    }else{
      $scope.isLoading = true;
      efSERVICES.getAllEvents(function(data){
        $scope.events = data;
        $scope.isLoading = false;
        $scope.$apply($scope.events);
        $scope.$apply($scope.isLoading);
      });
    }
  }

  $scope.init = function(){
    
    $scope.loadData();
  }

  $scope.init();


});

eventFlex.controller('SessionCTRL', function($scope, efSERVICES, $routeParams) {
  $scope.eventId = $routeParams.id;
  $scope.sessions = [];
  $scope.isLoading = false;

  $scope.test = '¡Adios!';

  $scope.loadData = function(){
      $scope.isLoading = true;
      
      efSERVICES.getSessionsForEvent($scope.eventId, function(data){
        $scope.sessions = data;
        $scope.isLoading = false;
        $scope.$apply($scope.sessions);
        $scope.$apply($scope.isLoading);
      });
  }

  $scope.init = function(){
    $scope.loadData();
  }

  $scope.loadData();

});




