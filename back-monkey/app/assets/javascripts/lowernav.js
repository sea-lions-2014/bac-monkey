$(function(){
  lowerNavEvents();
});

function lowerNavEvents(){
  $('#alc').click(toggleFormDisplay)
  $('#caffeine').click(toggleFormDisplay)
  $('#nicotine').click(toggleFormDisplay)
}

function toggleFormDisplay(){
  var form = '#' + $(this).attr('id') + "_form"
  $(form).removeClass('hidden');
  $(form).siblings().addClass('hidden');
}

