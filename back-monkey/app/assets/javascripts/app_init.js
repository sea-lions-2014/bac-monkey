$(function(){
  MonkeyApp.init();
});

var MonkeyApp = (function(){

  var _ajaxEvents = function(){
    $('#bac_form').on('ajax:success', {args: $(this).serialize()}, MonkeyApp.getBACChart);
    $('#caffeine_form').on('ajax:success', {args: $(this).serialize()}, MonkeyApp.getCaffeineChart);
    $('#nicotine_form').on('ajax:success', {args: $(this).serialize()}, MonkeyApp.getNicotineChart);
  }

  var _bindEvents = function(){
    $('#lower-nav a').click(LowerNav.toggleForms)
    $(".arrow").click(LowerNav.toggleNavHeight)
  }

  return{
    init: function(){
      _ajaxEvents();
      _bindEvents();
    },

    getBACChart: function(event, data, status, xhr){
      var dataObj = SubstanceDataParser.BACData(data);
      Chart.render(dataObj);
    },

    getCaffeineChart: function(event, data, status, xhr){
      var dataObj = SubstanceDataParser.BACData(data);
      Chart.render(dataObj);
    },

    getNicotineChart: function(event, data, status, xhr){
      var dataObj = SubstanceDataParser.BACData(data);
      Chart.render(dataObj);
    }

  }
})()