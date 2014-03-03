// this polutes the global namespace...booo
function lowerNavEvents(){
  $('#lower-nav a').click(toggleFormDisplay)
  $(".arrow").click(toggleLowerNavHeight)
}



function toggleFormDisplay(){
  var form = '#' + $(this).attr('id') + "_form"
  $(form).removeClass('hidden');
  $(form).siblings().addClass('hidden');
}

function toggleLowerNavHeight(){
  var height = ($('#up').hasClass('hidden')) ? '1.5em' : '15em'

  $('#footer').animate({
    height: height
  }, 800);

  $('.arrow').toggleClass('hidden');
}
