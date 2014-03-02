$(function(){
  lowerNavEvents();
});

function lowerNavEvents(){
  $('#bac').click(toggleFormDisplay)
  $('#caffeine').click(toggleFormDisplay)
  $('#nicotine').click(toggleFormDisplay)
}

function toggleFormDisplay(){
  var form = '#' + $(this).attr('id') + "_form"
  $(form).removeClass('hidden');
  $(form).siblings().addClass('hidden');
}

