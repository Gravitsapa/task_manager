// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

  return $('.tasks').sortable({
    axis: 'y',
    handle: '.handle',
    update: function() {
      return $.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  });
});

var reinitDatepicker = function(current){
	current.find('.datepick').datepicker({
		timepicker: true, 
		timeFormat: "hh:ii",
		dateFormat: "yyyy-mm-dd"
	});
};