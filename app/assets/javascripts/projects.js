// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var submitOnCheck = function(id){
	$("#edit_task_"+id).submit();
};

var initTasks = function() {
  return $('.tasks').sortable({
    axis: 'y',
    handle: '.handle',
    update: function() {
      return $.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  });
};