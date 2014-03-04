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
    $('#lower-nav a').click(LowerNav.toggleForms)
    $(".arrow").click(LowerNav.toggleNavHeight)
    $('#signin').click(MonkeyApp.toggleSignInForm)
  }

  var _cookieCheck = function(){
    //use ".selected" class to find visible form, perform cookieCheck
    //call cookieCheck from LowerNav.toggleForms ?
  }

  return{
    init: function(){
      _ajaxEvents();
      _bindEvents();
      _cookieCheck();
    },

    toggleSignInForm: function(){
      _toggleSignInForm();
    },

    getBACChart: function(event, data, status, xhr){
      var dataObj = SubstanceDataParser.BACData(data);
      $.cookie('#bac_form', dataObj);
      Chart.render(dataObj);
    },

    getCaffeineChart: function(event, data, status, xhr){
      var dataObj = SubstanceDataParser.caffeineData(data);
      $.cookie('#caffeine_form', dataObj);
      Chart.render(dataObj);
    },

    getNicotineChart: function(event, data, status, xhr){
      var dataObj = SubstanceDataParser.nicotineData(data);
      $.cookie('#nicotine_form', dataObj);
      Chart.render(dataObj);
    }

  }
})()