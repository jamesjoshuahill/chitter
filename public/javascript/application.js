function hideNotice() {
  $('#notice').delay(2500).slideUp(500);
}

function showLinkFavouritedNotice(cheep) {
  var favourited = !!$(cheep).data("favourited");
  var message = $(cheep).find('.message').text();
  var log_output = favourited ?
                message + " was added to favourites" :
                message + " was removed from favourites";
  console.log(log_output);
}

function addFavouritesHandler() {
  $(".star.solid").click(function() {
    var cheep = $(this).parent();
    var favourited = !!$(cheep).data("favourited");

    var newOpacity = favourited ? 0 : 1;
    $(cheep).data("favourited", !favourited);
    $(this).animate({opacity: newOpacity}, 1000);

    showLinkFavouritedNotice(cheep)
  });
}

$(function() {
  hideNotice();
  addFavouritesHandler();
});