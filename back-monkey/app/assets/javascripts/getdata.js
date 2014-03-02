$(function(){
  $('#alc_form').on('ajax:success', {args: $(this).serialize()}, getBACChart)
  $('#caffeine_form').on('ajax:success', {args: $(this).serialize()}, getCaffeineChart)
  $('#nicotine_form').on('ajax:success', {args: $(this).serialize()}, getNicotineChart)
});


function getBACChart(event, data, status, xhr){
  debugger
  var BACDataObj = formatData(data, 'BAC');
  Chart.draw(BACDataObj, $('#alc').css('background-color'));
}

function getCaffeineChart(event, data, status, xhr){
  var caffeineDataObj = formatData(data, 'mg of Caffeine')
  Chart.draw(caffeineDataObj, $('#caffeine').css('background-color'));
}

function getNicotineChart(event, data, status, xhr){
  var nicotineDataObj = formatData(data, 'mg of Nicotine')
  Chart.draw(nicotineDataObj, $('#nicotine').css('background-color'));
}


function formatData(data, key){
  var values = []
  for (var i=0; i< data.length; i++){
    values.push({x: data[i][0]*60, y: data[i][1]});
  }
  var dataObj = [
    {
      key: key,
      values: values
    }
  ]
  return dataObj;
}