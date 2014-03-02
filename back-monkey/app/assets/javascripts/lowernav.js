function lowerNavEvents(){
  $('#lower-nav a').click(toggleFormDisplay)
}

function toggleFormDisplay(){
  var form = '#' + $(this).attr('id') + "_form"
  $(form).removeClass('hidden');
  $(form).siblings().addClass('hidden');
}

