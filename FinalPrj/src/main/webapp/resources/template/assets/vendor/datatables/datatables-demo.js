// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('#dataTable').DataTable({
	"sDom": '<"row view-filter"<"col-sm-12"<"pull-left"l><"pull-right"f><"clearfix">>>t<"row view-pager"<"col-sm-12"<"text-center"ip>>>'
	});
});
