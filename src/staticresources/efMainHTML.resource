<div ng-show="isLoading">LOADING</div>
<ul ng-show="!isLoading">
	<li ng-repeat="event in events">{{event._props.Name}} | {{event._props.Start_date_time__c | date : 'H:mm dd MMM yy'}} - {{event._props.End_date_time__c | date : 'H:mm dd MMM yy'}} - <a href="#/session/{{event._props.Id}}">view</a> | <a href="/{{event._props.Id}}">debug</a></li>
</ul>
<div><a href="#/session/{{toSession}}">Go To Session</a></div>