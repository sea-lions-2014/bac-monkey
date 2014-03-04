$(function(){
  MonkeyApp.init();
});

var MonkeyApp = (function(){

  var _ajaxEvents = function(){
    $('#caffeine_form').on('ajax:success', {args: $(this).serialize()}, MonkeyApp.getCaffeineChart);
    $('#bac_form').on('ajax:success', {args: $(this).serialize()}, MonkeyApp.getBACChart);
    $('#nicotine_form').on('ajax:success', {args: $(this).serialize()}, MonkeyApp.getNicotineChart);
  }

  var _toggleSignInForm = function(){
    $('.signin_form').toggleClass('hidden');
    $('#user_user_name').focus();
  }

  var _bindEvents = function(){
    $('#lower_nav a').click(LowerNav.toggleForms)
    $(".arrow").click(LowerNav.toggleNavHeight)
    $('#signin').click(MonkeyApp.toggleSignInForm)
  }

  var _cookieCheck = function(){
    if ($.cookie('dataObj')){
      Chart.render($.cookie('dataObj'))
    }
  }

  return{
    init: function(){
      _ajaxEvents();
      _bindEvents();
      $.cookie.json = true;
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