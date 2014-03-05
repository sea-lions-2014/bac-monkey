var Chart = (function(){

  var _clearHomePage = function(){
    $('#welcome_msg').remove();
    $('svg:empty').remove();
  }

  var _styleChart = function(dataObj){
    var substance = dataObj[0].key.split(' ');
    substance = substance[substance.length-1].toLowerCase();
    var color = $('#'+substance).css('background-color');
    $('.nv-line').css('stroke', color);
    $('.nv-legend-symbol').css('stroke', color).css('fill', color);
    $('.nv-group').css('stroke', color).css('fill', color)
  }

  var _buildChart = function(dataObj){
    d3.select('#svg-container').insert('svg', '#footer').attr('id', 'chart');

    nv.addGraph(dataObj)
    var chart = nv.models.lineChart()
                .margin({left: 100})  //Adjust chart margins to give the x-axis some breathing room.
                .useInteractiveGuideline(true)  //Tooltips and guideline
                .transitionDuration(350)  //Line transition time
                .showLegend(true)       //Show the legend
                .showYAxis(true)        //Show the y-axis
                .showXAxis(false)        //Show the x-axis
    ;

    chart.xAxis
        .axisLabel("Time")
    ;

    chart.yAxis
        .axisLabel(dataObj[0].key)
        .tickFormat(d3.format(".4s"))
    ;

    d3.select("svg")
        .datum(dataObj)
        .transition().duration(500).call(chart)
    ;

    nv.utils.windowResize(
            function() {
              chart.update();
            }
    );

    _chartWarning(dataObj);

    return chart;
  }

  var _chartWarning = function(dataObj){
    $('.bac-limit').hide()
    if (dataObj[0].key === 'BAC'){

      var BACvalues =  $.map(dataObj[0].values, function(value, index) {
                      return [value.y];
                    });

      var max = Math.max.apply(null, BACvalues)

      if(max > 0.42){
        $('.drive').hide();
        $('.dead').show();
      }
      else if(max > 0.08){
        $('.dead').hide();
        $('.drive').show();
      }
    }
  }

  return {
    render: function(dataObj){
      _buildChart(dataObj);
      _clearHomePage();
      _styleChart(dataObj);
    }
  }

})()

