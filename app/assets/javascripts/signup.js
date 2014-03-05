var SignUp = (function(){
  var _enableMobileMode = function(){
    $('#desktop_registration').hide();
    $('#mobile_registration').show();
  }

  var _enableDesktopMode = function(){
    $('#desktop_registration').show();
    $('#mobile_registration').hide();
  }

  return {
    mobileMode: function(){
      _enableMobileMode();
    },

    desktopMode: function(){
      _enableDesktopMode();
    }
  }
})()