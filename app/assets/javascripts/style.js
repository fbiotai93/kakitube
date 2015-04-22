var ready;
ready = function() {

	$('.display').DataTable({
    "aaSorting": []
  });

  oTable = $('#postLists').DataTable();

};

$(document).ready(ready);
$(document).on('page:load', ready);