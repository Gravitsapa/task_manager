// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

//$(document).ready(initTasks());

var reinitDatepicker = function(current){
	current.find('.datepick').datepicker({
		timepicker: true, 
		timeFormat: "hh:ii",
		dateFormat: "yyyy-mm-dd"
	});
};

