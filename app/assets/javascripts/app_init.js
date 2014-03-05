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
  }

  var _toggleSignInForm = function(){
    $('.signin_form').toggleClass('hidden');
    $('#user_user_name').focus();
  }

  var _bindEvents = function(){
    $('#lower_nav a').click(LowerNav.toggleForms);
    $(".arrow").click(LowerNav.toggleNavHeight);
    $('#signin').click(MonkeyApp.toggleSignInForm);
    $(window).resize(_screenCheck);
  }

  var _cookieCheck = function(){
    $.cookie.json = true;
    if ($.cookie('dataObj') && $('#svg-container').length > 0){
      Chart.render($.cookie('dataObj'));
    }
  }

  var _screenCheck = function(){
    if($(document).width() <= 630){
      SignUp.mobileMode();
      LowerNav.mobileMode();
    }
    else
    {
      SignUp.desktopMode();
      LowerNav.desktopMode();
    }
  }

  return{
    init: function(){
      _screenCheck();
      _ajaxEvents();
      _bindEvents();
      _cookieCheck();
    },

    toggleSignInForm: function(){
      _toggleSignInForm();
    },

    getBACChart: function(event, data, status, xhr){
      var dataObj = SubstanceDataParser.BACData(data);
      $.cookie('dataObj', dataObj);
      Chart.render(dataObj);
    },

    getCaffeineChart: function(event, data, status, xhr){
      var dataObj = SubstanceDataParser.caffeineData(data);
      $.cookie('dataObj', dataObj);
      Chart.render(dataObj);
    },

    getNicotineChart: function(event, data, status, xhr){
      var dataObj = SubstanceDataParser.nicotineData(data);
      $.cookie('dataObj', dataObj);
      Chart.render(dataObj);
    }

  }
})()