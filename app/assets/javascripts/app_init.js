$(function(){
  MonkeyApp.init();
});

var MonkeyApp = (function(){

  var _ajaxEvents = function(){
    $('#caffeine_form').on('ajax:success', {args: $(this).serialize()}, MonkeyApp.getCaffeineChart);
    $('#bac_form').on('ajax:success', {args: $(this).serialize()}, MonkeyApp.getBACChart);
    $('#nicotine_form').on('ajax:success', {args: $(this).serialize()}, MonkeyApp.getNicotineChart);
    $('#s_caffeine_form').on('ajax:success', {args: $(this).serialize()}, MonkeyApp.getCaffeineChart);
    $('#s_bac_form').on('ajax:success', {args: $(this).serialize()}, MonkeyApp.getBACChart);
    $('#s_nicotine_form').on('ajax:success', {args: $(this).serialize()}, MonkeyApp.getNicotineChart);
    $('#sign_')
  }

  var _toggleSignInForm = function(){
    $('.signin_form').toggle();
    if(_mobileUser()){
      LowerNav.toggleNavHeight();
    }
    $('#user_user_name').focus();
  }

  var _toggleAbout = function() {
    event.preventDefault();
    $('#blurb').toggleClass('hidden');
    $('#about').toggleClass('hidden');
  }

  var _clearCookies = function(){
    $.removeCookie('dataObj')
  }

  var _bindEvents = function(){
    $('#lower_nav a').click(function(event){
      LowerNav.toggleForms(event.target)
    });
    $(".arrow").click(LowerNav.toggleNavHeight);
    $('#signin').click(MonkeyApp.toggleSignInForm);
    $('#signout').click(_clearCookies);
    $('#login_form').submit(_clearCookies);
    $(window).resize(_toggleLayout);
    $('#about_button').click(_toggleAbout);
  }

  var _mobileUser = function(){
    return $(document).width() <= 680
  }

  var _cookieCheck = function(){
    $.cookie.json = true;
    if ($.cookie('dataObj') && $('#svg-container').length > 0){
      Chart.render($.cookie('dataObj'));
    }
  }

  var _toggleLayout = function(){
    if(_mobileUser()){
      SignUp.mobileMode();
      LowerNav.mobileMode();
    }
    else
    {
      SignUp.desktopMode();
      LowerNav.desktopMode();
    }
  }

  var _renderChart = function(dataObj){
    $.cookie('dataObj', dataObj);
    Chart.render(dataObj);
    if (_mobileUser()){
      LowerNav.toggleNavHeight();
    }
  }

  return{
    init: function(){
      _toggleLayout();
      _ajaxEvents();
      _bindEvents();
      _cookieCheck();
    },

    toggleSignInForm: function(){
      _toggleSignInForm();
    },

    getBACChart: function(event, data, status, xhr){
      var dataObj = SubstanceDataParser.BACData(data);
      _renderChart(dataObj);
    },

    getCaffeineChart: function(event, data, status, xhr){
      var dataObj = SubstanceDataParser.caffeineData(data);
      _renderChart(dataObj);
    },

    getNicotineChart: function(event, data, status, xhr){
      var dataObj = SubstanceDataParser.nicotineData(data);
      _renderChart(dataObj);
    },

  }
})()