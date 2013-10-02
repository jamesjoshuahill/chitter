function hideNotice() {
  $('#notice').delay(2500).slideUp(500);
}

function addFavouritesHandler() {
  $(".star.solid").click(function() {
    $(this).animate({opacity: 1}, 500);
  });
}

$(function() {
  hideNotice();
  addFavouritesHandler();
});