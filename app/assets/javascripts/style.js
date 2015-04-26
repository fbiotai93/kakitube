var ready;
ready = function() {

	// dataTable
	$('.display').DataTable({
    "aaSorting": []
  });

  oTable = $('#postLists').DataTable();

  // Carousel using Slick

  $('.carousel').slick({
    arrows: false,
    autoplay: true,
  	autoplaySpeed: 5000,
  	pauseOnHover: false
  });

};

$(document).ready(ready);
$(document).on('page:load', ready);