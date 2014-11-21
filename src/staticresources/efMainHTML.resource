<div ng-show="isLoading">
	<center>LOADING</center>
</div>
<div>
	
	<h4><span class="s1icon s1icon-s-event"></span> Events</h4>
	
</div>
<div ng-show="!isLoading">
	<div ng-repeat="event in events" class="card" ng-click="goTo(event._props.Id)">
		<div class="card-heading">
		    {{event._props.Name}}
		    <a class="pull-right" href="/{{event._props.Id}}"><i class="s1utility s1utility-reply"></i></a>
		</div>
		<ul class="card-detail">
		    <li>{{event._props.Start_date_time__c | date : 'H:mm dd MMM yy'}} - {{event._props.End_date_time__c | date : 'H:mm dd MMM yy'}}</li>
		    <li>{{event._props.Venue_text__c}}</li>
	  	</ul>
	  	<div class="cardnav">
  			<div class="col-xs-4">
  				<center>
  				<a ng-click="navigateTo(event._props.Id)"><span class="s1utility s1utility-edit"></span>
  				Details
  				</a>
  				</center>
  			</div>
  			<div class="col-xs-4">
  				<center>
  				<a href="#/session/{{event._props.Id}}"><span class="s1utility s1utility-event"></span>
  				Sessions
  				</a>
  				</center>
  			</div>
  			<div class="col-xs-4">
  				<center>
  				<a ng-href="#/analytics/{{event._props.Id}}"><span class="s1utility s1utility-news"></span>
  				Analytics
  				</a>
  				</center>
  			</div>
	  	</div>
</div>