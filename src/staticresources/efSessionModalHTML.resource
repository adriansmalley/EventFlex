<div class="row">
<div class="col-md-8">
	<h4>Details</h4>
	<div >
		<span class="s1utility s1utility-event"></span> {{item._props.Start_date_time__c |  date:'HH:mm EEE dd MMM'}} - {{item._props.End_date_time__c | date:'HH:mm EEE dd MMM'}}
	</div>
	<div >
	<span class="s1utility s1utility-checkin"></span> {{item._props.Location_text__c}}
	</div>
	<div >
	<span class="s1utility s1utility-people"></span> {{item._props.Confirmed_Attendees__c}} of {{item._props.Maximum_Volume__c}}
	</div>
	<hr/>
	<h4>Session Description</h4>
	{{item._props.Description__c}}
	<hr/>
	<h4>Speakers</h4>
	<div>
	<div class="col-xs-6" ng-repeat="speaker in item.Speakers">
		<div class="media" >
	    	<a class="pull-left" >
	      		<img class="media-object" src="/profilephoto/005/F" style="width:32px;height:32px">
	    	</a>
	    	<div class="media-body">
	      		<h5 class="media-heading">{{speaker.Speaker_Name__c}}</h5>
	      		{{speaker.Biography__c}}
	    	</div>
	  	</div>
  	</div>
  	</div>

  	
</div>
<div class="col-md-4">
	
	<h4>Social Posts</h4>
	<div style="max-height:400px; overflow:scroll">
		<div>
		<div class="media" ng-repeat="post in socialposts">
	    	<a class="pull-left" >
	      		<img class="media-object" src="/profilephoto/005/F" style="width:32px; height:32px">
	    	</a>
	    	<div class="media-body">
	      		{{post._props.Post_text__c}}
	    	</div>
	  	</div>
	  	</div>
  	</div>
  	<div ng-show="item.ContactAttendance!=null">
  	<hr/>
	
	<h4>Contacts Attending</h4>
	<div>
		
			<div class="media" ng-repeat="contact in item.ContactAttendance">
		    	<a class="pull-left" >
		      		<img class="media-object" src="/profilephoto/005/F" style="width:32px; height:32px">
		    	</a>
		    	<div class="media-body">
		      		<h5 class="media-heading">{{contact.Contact__r.Name}} </h5>
		      		{{contact.Contact__r.Title}} - {{contact.Contact__r.Account.Name}}
		    	</div>
		  	</div>
	  	
  	</div>
  	</div>
</div>
</div>