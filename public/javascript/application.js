function hideNotice() {
  $('#notice').delay(2500).slideUp(500);
}

function showLinkFavouritedNotice(cheep) {
  var favourited = !!$(cheep).data("favourited");
  var name = $(cheep).find('.name').text();
  var message = $(cheep).find('.message').text();
  var log_output = favourited ?
                "You love " + name + "'s cheep: " + message :
                "You fall out of love with " + name + "'s cheep: " + message;
  console.log(log_output);
}

function addFavouritesHandler() {
  $(".heart.solid").click(function() {
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