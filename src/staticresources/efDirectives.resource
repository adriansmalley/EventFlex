eventFlex.directive('modalDialog', function(){
	return {
		restrict : 'E',
		scope: {
			show : '=',
			modaltitle : '='
		},
		replace: true, 
		transclude: true,
		link: function(scope, element, attrs){
			scope.dialogStyle = {};
			
			scope.hideModal = function() {
				scope.show = false;
			}
		},
		templateUrl: staticItems['efModalTemplateHTML']
	};
});


eventFlex.directive('efContent',['efSERVICES', function(efSERVICES){
	return {
		restrict : 'A',
		scope: {
			templateurl : '=',
			item: '=' 
		},
		replace: true, 
		link: function(scope, element, attrs){
			scope.socialposts = [];

			scope.getPosts = function(){
				efSERVICES.getSocialPosts(scope.item._props.Id, function(data){
					scope.socialposts = data;
					scope.$apply(scope.socialposts);
					console.debug(data);
				});
			}
			
			scope.$watch('item', function(){
				if(scope.item!=null){
					console.debug(scope.show);
					scope.getPosts();
				}
			});

		},
		templateUrl:staticItems['efSessionModalHTML']
	};
}]);