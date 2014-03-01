$(function(){
  $('#alc_form').on('ajax:success', {args: $(this).serialize()}, formatBACData)
  $('#caffeine_form').on('ajax:success', {args: $(this).serialize()}, formatBACData)
  $('#nicotine_form').on('ajax:success', {args: $(this).serialize()}, formatBACData)
});


function formatBACData(event, data, status, xhr){
  formatData(data, 'BAC')
}

function formatCaffeineData(event, data, status, xhr){
  formatData(data, 'Caffeine')
}

function formatNicotineData(event, data, status, xhr){
  formatData(data, 'Nicotine')
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
  drawChart(dataObj);
}