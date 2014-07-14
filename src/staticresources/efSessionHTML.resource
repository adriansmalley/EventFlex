<div ng-show="isLoading">LOADING</div>
<ul ng-show="!isLoading">
	<li ng-repeat="session in sessions">{{session._props.Name}}</li>
</ul>


<a href="#/">Go Back</a>