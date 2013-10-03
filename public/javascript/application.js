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

function prepareAjaxGetFormsHandler() {
  $('.add-cheep-link, .sign-up-link, .log-in-link').click(function(event) {
    $.get($(this).attr("href"), function(data) {
      if ($('#ajax-form').length == 0) {
        $('#container').prepend("<div id='ajax-form'></div>");
      }
      $("#ajax-form").html(data);
      prepareAjaxPostFormsHandler();
    });
    event.preventDefault();
  });
}

function prepareAjaxPostFormsHandler() {
  var form = $('#ajax-form form');
  form.submit(function(event) {    
    var updateCheeps = function(data) {
      $('#container').html(data);
      addFavouritesHandler();
    }
    var data = form.serialize();
    $.post(form.attr('action'), data, updateCheeps);
    event.preventDefault();
  });
}

$(function() {
  prepareAjaxGetFormsHandler();
  hideNotice();
  addFavouritesHandler();
});