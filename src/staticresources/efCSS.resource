.slide {
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
}
.slide.ng-enter,
.slide.ng-leave {
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    -o-transition: all 0.2s ease;
    transition: all 0.2s ease;
}
.slide.ng-enter {
    left: 100%;
}
.slide.ng-enter-active {
    left: 0;
}
.slide.ng-leave {
    left: 0;
}
.slide.ng-leave-active {
    left: -100%;
}
.ng-modal-overlay {
	  /* A dark translucent div that covers the whole screen */
	  position:absolute;
	  z-index:9999;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background-color:#000000;
	  opacity: 0.8;
	}
.ng-modal-dialog {
	  /* A centered div above the overlay with a box shadow. */
	  z-index:10000;
	  position: absolute;
	  width: 50%; /* Default */

	  /* Center the dialog */
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  -webkit-transform: translate(-50%, -50%);
	  -moz-transform: translate(-50%, -50%);

	  background-color:#000000;
	  box-shadow: 4px 4px 80px #000;
	}
.ng-modal-dialog-content {
	  padding:10px;
	  text-align: left;
	}
	.clearFilter{
		position: absolute;
		right:0px;
		bottom: 0px;
	}
	.sessionSeperator{
		margin-top:10px;
		margin-bottom: 10px;
		padding-top:10px;
		padding-bottom: 10px; 

	}
	.modal-dialog.modal-lg{
		width: 85%;
	}
	.filters{
		background-color: #ededed;
	}
	.list-group-item.hot{
		background-color: #FFEED8;
	}
	.navbar-header small{
		font-size: 12px;
	}
	.headerfilters{
		background-color: white;
		padding: 10px 0px;
		
	}
	.ganttchart{
		background-color: white;
		padding:10px 0px;
		margin-bottom: 10px;
		border-bottom: 1px solid #ededed;
		box-shadow: 0px 3px 3px #ccc;

	}
.ng-modal-close {
	  position: absolute;
	  top: 3px;
	  right: 5px;
	  padding: 5px;
	  cursor: pointer;
	  font-size: 120%;
	  display: inline-block;
	  font-weight: bold;
	  font-family: 'arial', 'sans-serif';
	}
	.cardnav{
		
		border-top:1px solid #ededed;
		overflow: hidden;
	}
	.cardnav > div{
		background-color: #f4f4f4;
		padding:10px;
	}
