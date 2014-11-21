<style>
	.gantt-row-height {
		height: 3em;
	}
</style>
<div ng-show="isLoading" style="left:50%; top:50%; position:absolute">
  <img src="/img/loading.gif"/>
</div>
<div ng-show="!isLoading">
<div class="navbar navbar-inverse row" style="margin-bottom:0px; height: 80px; border-radius: 0px;">
  <div class="navbar-header navbar-brand">
    {{eventDetails._props.Name}} <br/>
    <small>{{eventDetails._props.Start_date_time__c | date : 'H:mm EEE dd MMM yy'}} - {{eventDetails._props.End_date_time__c | date : 'H:mm EEE dd MMM yy'}}</small>
  </div>
  <div class="collapse navbar-collapse pull-right">
    
       <button ng-click="raiseCase()" class="btn navbar-btn btn-sm btn-warning" >Raise Case</button>
  </div>
</div>

<div class="row headerfilters">
  <div class="col-xs-12">
    <div>
      <ul class="nav nav-tabs" role="tablist">
        <li ng-class="{'active' : evtDt==currEvtDate}" ng-repeat="evtDt in eventDates"><a ng-click="changeDate(evtDt)">{{evtDt | date : 'EEE dd MMM yy'}}</a></li>
        <li class="pull-right">
          <div class="dropdown">
            <button class="btn btn-link dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
          Group By : {{groupBy.Label}}
          <span class="caret"></span>
        </button>
            <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="dropdownMenu">
              
              <li ng-repeat="grp in groupByOptions" >
                <a tabindex="-1"  ng-click="refreshGrid(grp)">{{grp.Label}}</a>
              </li>
            </ul>
          </div>
        </li>
      </ul>
     </div>
 
  </div>
</div>
 
</div>
<div class="row ganttchart" ng-show="!isLoading">
  
  <div class="col-md-12">
    
    <gantt first-day-of-week="1"
           load-data="loadGanttData = fn"
           remove-data="removeData = fn"
           clear-data="clearGanttData = fn"
           sort-mode="mode"
           view-scale="scale"
           column-width="scale === 'month' && 20 || (scale === 'week' && 10 || 6)"
           column-sub-scale="scale === 'week' && 7 || 6"
           work-hours="[9,10,11,12,13,14,15,16,17,18]"
           show-non-work-hours="showNonWorkHours"
           weekend-days="[0,6]"
           show-weekends="showWeekends"
           show-tooltips="false"
           max-height="maxHeight"
           on-gantt-ready="addSamples()"
           on-label-clicked="labelEvent(event)"
           on-label-dbl-clicked="labelEvent(event)"
           on-label-context-clicked="labelEvent(event)"
           on-label-header-clicked="labelHeaderEvent(event)"
           on-label-header-dbl-clicked="labelHeaderEvent(event)"
           on-label-header-context-clicked="labelHeaderEvent(event)"
           on-row-added="rowEvent(event)"
           on-row-clicked="rowEvent(event)"
           on-row-dbl-clicked="rowEvent(event)"
           on-row-context-clicked="rowEvent(event)"
           on-row-updated="rowEvent(event)"
           on-scroll="scrollEvent(event)"
           on-task-clicked="taskEvent(event)"
           on-task-dbl-clicked="taskEvent(event)"
           on-task-context-clicked="taskEvent(event)"
           on-task-updated="taskEvent(event)"
           template-url="/resource/1405341046000/efLibs/angular-gantt/template/gantt.tmpl.html">
</gantt>
</div>
  </div>
 
  <div class="row" ng-show="!isLoading">
    <div class="col-md-12">
      <ul class="nav nav-tabs" role="tablist">
        <li ng-class="{'active' : activeTab=='Future'}"><a ng-click="activeTab='Future'">Coming Up</a></li>
        <li ng-class="{'active' : activeTab=='Past'}"><a ng-click="activeTab='Past'">Past</a></li>
        
      </ul>
      <div class="col-xs-8" >

        <div ng-show="activeTab=='Future'">
        
          <div ng-repeat="(dt, sessionItem) in sessionList" >
            <div ng-show="(sessionItem | filter : filterCriteria).length > 0">

            <h5 class="sessionSeperator">{{getDate(dt) | date:'HH:mm EEE dd MMM'}} • {{(sessionItem | filter : filterCriteria).length}} Session<span ng-show="(sessionItem | filter : filterCriteria).length > 1">s</span></h5>
           <div class="panel panel-default">
           <div class="list-group">
             <a class="list-group-item" ng-class="{'hot' : session._props.Social_Posts__c > 0}" ng-repeat="session in sessionItem | filter : filterCriteria" ng-click="viewSession(session._props.Id)">
              <h4 class="list-group-item-heading">{{session._props.Name}} <span class="label label-warning pull-right" ng-show="session._props.Social_Posts__c > 0"><i class="glyphicon glyphicon-fire"></i> HOT ({{session._props.Social_Posts__c}})</span> &nbsp;
              <span class="label label-primary pull-right" ng-show="session.ContactAttendance!=null"><i class="glyphicon glyphicon-user"></i> CONTACTS ({{session.ContactAttendance.length}})</span>
              </h4>
              <h5 class="media-heading">
                <span>{{session._props.Start_date_time__c | date:'HH:mm EEE dd MMM'}}</span> • <span> {{session._props.Location_text__c}} </span>  •  <span ng-repeat="speaker in session.Speakers">{{speaker.Speaker_Name__c}} </span> • <span>{{session._props.Confirmed_Attendees__c}} / {{session._props.Maximum_Volume__c}}</span> • <span ng-repeat="topic in session.Topics">#{{topic.Name}}</span></h5>
              <p class="list-group-item-text">{{session._props.Short_description__c}}</p>

              </a>
           </div>
           </div>
           </div>
         </div>
         </div>
         <div ng-show="activeTab=='Past'">
            <div ng-repeat="(dt, sessionItem) in sessionList" >
            <div ng-show="(sessionItem | filter : filterCriteria).length > 0">

            <h5 class="sessionSeperator">{{getDate(dt) | date:'HH:mm EEE dd MMM'}} • {{(sessionItem | filter : filterCriteria).length}} Session<span ng-show="(sessionItem | filter : filterCriteria).length > 1">s</span></h5>
           <div class="panel panel-default">
           <div class="list-group">
             <a class="list-group-item" ng-class="{'hot' : session._props.Social_Posts__c > 0}" ng-repeat="session in sessionItem | filter : filterCriteria" ng-click="viewSession(session._props.Id)">
              <h4 class="list-group-item-heading">{{session._props.Name}} <span class="label label-warning pull-right" ng-show="session._props.Social_Posts__c > 0"><i class="glyphicon glyphicon-fire"></i> HOT ({{session._props.Social_Posts__c}})</span> &nbsp;
              <span class="label label-primary pull-right" ng-show="session.ContactAttendance!=null"><i class="glyphicon glyphicon-user"></i> CONTACTS ({{session.ContactAttendance.length}})</span>
              </h4>
              <h5 class="media-heading">
                <span>{{session._props.Start_date_time__c | date:'HH:mm EEE dd MMM'}}</span> • <span> {{session._props.Location_text__c}} </span>  •  <span ng-repeat="speaker in session.Speakers">{{speaker.Speaker_Name__c}} </span> • <span>{{session._props.Confirmed_Attendees__c}} / {{session._props.Maximum_Volume__c}}</span> • <span ng-repeat="topic in session.Topics">#{{topic.Name}}</span></h5>
              <p class="list-group-item-text">{{session._props.Short_description__c}}</p>

              </a>
           </div>
           </div>
           </div>
         </div>
          
         </div>
      </div>
         <div class="col-xs-4">
         <h4>Quick Find</h4>
          <div style="position:relative">
            <input class="form-control input-sm" type="search" ng-model="filterCriteria" />
            <div class="clearFilter" ng-show="filterCriteria.length > 0">
              <a ng-click="filterCriteria = ''" class="btn btn-sm"><i class="s1utility s1utility-close"></i></a>
            </div>
          </div>
          <hr/>
         <h4>Featured Speakers</h4>
          <div>
           <div class="media" ng-class="{'active' : speaker._props.Speaker_Name__c == filterCriteria}" ng-repeat="speaker in featuredSpeakers" ng-click="searchForText(speaker._props.Speaker_Name__c)">
            <a class="pull-left" >
              <img class="media-object" src="/profilephoto/005/F" style="width:32px; height:32px">
            </a>
            <div class="media-body">
              <h5 class="media-heading">{{speaker._props.Speaker_Name__c}}</h5>
              {{speaker._props.Biography__c}}
            </div>
          </div>
         </div>
         </div>
      </div>
      

    
  </div>
  
</div>

<modal-dialog show="modalShown" modaltitle="sessionDetails._props.Name">
  <div ef-content="" templateurl="modalURL" item="sessionDetails"></div>
</modal-dialog>
<!-- template-url="/resource/1405341046000/efLibs/angular-gantt/template/gantt.tmpl.html -->
<a href="#/">Go Back</a>
<div ng-show="false">
	{{test}}
	{{sessionId}}
	blah
  </div>
</div>