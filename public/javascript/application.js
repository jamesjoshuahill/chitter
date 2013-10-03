function hideNotice() {
  $('.notice').delay(2500).slideUp(500);
}

function showLinkFavouritedNotice(cheep) {
  var favourited = !!$(cheep).data("favourited");
  var name = $(cheep).find('.name').text();
  var message = $(cheep).find('.message').text();
  var notice = favourited ?
                "You love " + name + "'s cheep: " + message :
                "You fall out of love with " + name + "'s cheep: " + message;
  var flash = $("<div></div>").addClass('notice').html(notice);
  $(flash)
  $(flash).appendTo('#flash').hide().slideDown(500).delay(2500).slideUp(500);
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

function prepareAddCheepHandler() {
  $('.add-cheep-link').click(function(event) {
    $.get($(this).attr("href"), function(data) {
      $("#container").prepend(data);
    });
    event.preventDefault();
  });
}

$(function() {
  prepareAddCheepHandler();
  hideNotice();
  addFavouritesHandler();
});