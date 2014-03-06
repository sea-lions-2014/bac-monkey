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

  var _toggleForms = function(target){
    var idString = target.id.substring(target.id.indexOf('_')+1, target.id.length);
    var form = '#' + idString + "_form";
    $('[id*='+idString+'_form]').siblings().addClass('hidden');
    $('[id*='+idString+'_form]').removeClass('hidden');
  }

  var _toggleNavHeight = function(){
    var height = ($('#up').hasClass('hidden')) ? '1.5em' : '15em'

    $('#footer').animate({
      height: height
    }, 800);

    $('.arrow').toggleClass('hidden');
  }

  return {
    toggleForms: function(target){
      _toggleForms(target);
    },

    mobileMode: function(){
      _enableMobileMode();
    },

    desktopMode: function(){
      _enableDesktopMode();
    },

    toggleNavHeight: function(){
      _toggleNavHeight();
    }
  }
})()