var LowerNav = (function(){

  var _enableMobileMode = function(){
    $('#desktop_forms').hide();
    $('#desktop_links').hide();
    $('#mobile_forms').show();
    $('#mobile_links').show();
  }

  var _enableDesktopMode = function(){
    $('#mobile_forms').hide();
    $('#mobile_links').hide();
    $('#desktop_forms').show();
    $('#desktop_links').show();
  }

  return {
    toggleForms: function(){
      var form = '#' + $(this).attr('id') + "_form";
      $(form).removeClass('hidden');
      $(form).siblings().addClass('hidden');
    },

    mobileMode: function(){
      _enableMobileMode();
    },

    desktopMode: function(){
      _enableDesktopMode();
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