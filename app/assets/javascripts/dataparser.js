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

  return {
    BACData: function(data){
      return _formatData(data, 'BAC');
    },

    caffeineData: function(data){
      return _formatData(data, 'mg of Caffeine');
    },

    nicotineData: function(data){
      return _formatData(data, 'mg of Nicotine')
    }
  }
})()
