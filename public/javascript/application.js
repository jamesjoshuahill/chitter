function hideNotice() {
  $('#notice').delay(2500).slideUp(500);
}

function addFavouritesHandler() {
  $(".star.solid").click(function() {
    var cheep = $(this).parent();
    var favourited = !!$(cheep).data("favourited");

    var newOpacity = favourited ? 0 : 1;
    $(cheep).data("favourited", !favourited);
    $(this).animate({opacity: newOpacity}, 1000);
  });
}

$(function() {
  hideNotice();
  addFavouritesHandler();
});