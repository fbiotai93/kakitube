var ready;
ready = function() {

  $(".cls").on('hidden.bs.modal', function (e) {
    $(".cls iframe").attr("src", $(".cls iframe").attr("src"));
  });

  $(".cls-you").on('hidden.bs.modal', function (e) {
    $(".cls-you iframe").attr("src", $(".cls-you iframe").attr("src"));
  });

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