$(function(){
  $('#alc_form').on('ajax:success', {args: $(this).serialize()}, formatData)
});


function formatData(event, data, status, xhr){
  var values = []
  for (var i=0; i< data.length; i++){
    values.push({x: data[i][0]*60, y: data[i][1]});
  }
  var dataObj = [
    {
      key: "BAC",
      values: values,
      color: "#d34245"
    }
  ]

  drawChart(dataObj);
}