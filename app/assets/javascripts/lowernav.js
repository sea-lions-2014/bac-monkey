var LowerNav = (function(){
  return {
    toggleForms: function(){
      var form = '#' + $(this).attr('id') + "_form";
      $(form).removeClass('hidden');
      $(form).siblings().addClass('hidden');
    },

    toggleNavHeight: function(){
      var height = ($('#up').hasClass('hidden')) ? '1.5em' : '15em'

      $('#footer').animate({
        height: height
      }, 800);

      $('.arrow').toggleClass('hidden');
    }
  }
})()