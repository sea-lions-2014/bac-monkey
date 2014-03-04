var SubstanceDataParser = (function(){
  var _formatData = function(data, key){
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

  var _maxBAC = function(data){
    var max = d3.max(data, function(array) {
      return d3.max(array.slice(1));
    });
    if(max > 0.42){
      $('.dead').removeClass('hidden')
    }
    else if(max > 0.08){

    }
  }

  return {
    BACData: function(data){
      _maxBAC(data)
      return _formatData(data, 'BAC');
    },

    caffeineData: function(event, data, status, xhr){
      return formatData(data, 'mg of Caffeine');
    },

    nicotineData: function(event, data, status, xhr){
      return formatData(data, 'mg of Nicotine')
    }
  }
})()
