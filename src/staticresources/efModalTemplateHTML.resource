<div ng-modal ng-show='show'>
  <div class='ng-modal-overlay' ng-click='hideModal()'></div>
	<div class="modal-dialog modal-lg ng-modal-dialog">

    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" ng-click="hideModal()"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">{{modaltitle}}</h4>
      </div>
      <div class="modal-body">
        <div ng-transclude></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" ng-click="hideModal()">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>

	<!--
  <div class='ng-modal-dialog' ng-style='dialogStyle'>
    <div class='ng-modal-close' ng-click='hideModal()'>X</div>
    <div class='ng-modal-dialog-content' ng-transclude></div>
  </div>
  -->
	</div>
</div>

	