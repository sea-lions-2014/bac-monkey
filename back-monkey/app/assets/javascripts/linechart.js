var Chart = (function(){

  var _buildChart = function(dataObj){
    nv.addGraph(dataObj)
    
    var chart = nv.models.lineChart()
                .margin({left: 100})  //Adjust chart margins to give the x-axis some breathing room.
                .useInteractiveGuideline(true)  //Tooltips and a guideline!
                .transitionDuration(350)  //how fast do you want the lines to transition?
                .showLegend(true)       //Show the legend, allowing users to turn on/off line series.
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
      .transition().duration(500).call(chart);

      nv.utils.windowResize(
              function() {
                  chart.update();
              });

    return chart;
  }

  var _cleanUpHomepage = function(){
    $('#welcome_msg').remove();
    $('svg').remove();
    d3.select('body').insert('svg', '#footer').attr('id', 'chart');
  }

  var _styleChart = function(color){
    $('.nv-legend-symbol').css('fill', color);
    $('.nv-point').css('stroke', color);
    $('.nv-line').css('stroke', color)
    $('.legend-color-guide div').css('background-color', color)
  }

  return {
    draw: function(dataObj, color){
      _cleanUpHomepage();
      _buildChart(dataObj);
      _styleChart(color);
    }
  }

})()

