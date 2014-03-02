function AJAXEvents(){
  $('#bac_form').on('ajax:success', {args: $(this).serialize()}, formatBACData)

  $('#caffeine_form').on('ajax:success', {args: $(this).serialize()}, formatCaffeineData)

  $('#nicotine_form').on('ajax:success', {args: $(this).serialize()}, formatNicotineData)
}

function formatBACData(event, data, status, xhr){
  var BACdataObj = formatData(data, 'BAC');
  Chart.render(BACdataObj);
}

function formatCaffeineData(event, data, status, xhr){
  var caffeineDataObj = formatData(data, 'mg of Caffeine');
  Chart.render(caffeineDataObj);
}

function formatNicotineData(event, data, status, xhr){
  var nicotineDataObj = formatData(data, 'mg of Nicotine');
  Chart.render(nicotineDataObj);
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
  return dataObj
}