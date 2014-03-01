
//Draw line chart
function drawChart(dataObj) {
  $('#welcome_msg').remove();
  d3.select('body').insert('svg', '#footer').attr('id', 'chart');

  nv.addGraph(dataObj)
      var chart = nv.models.lineChart()
                  .margin({left: 100})  //Adjust chart margins to give the x-axis some breathing room.
                  .useInteractiveGuideline(true)  //We want nice looking tooltips and a guideline!
                  .transitionDuration(350)  //how fast do you want the lines to transition?
                  .showLegend(false)       //Show the legend, allowing users to turn on/off line series.
                  .showYAxis(true)        //Show the y-axis
                  .showXAxis(false)        //Show the x-axis
  ;


      chart.xAxis
          .axisLabel("Time")
          ;

      chart.yAxis
          .axisLabel("BAC")
          .tickFormat(d3.format(".4s"))
          ;

      // chart.forceY([0,0.08])

      d3.select("svg")
          .datum(dataObj)
          .transition().duration(500).call(chart);

      nv.utils.windowResize(
              function() {
                  chart.update();
              }
          );

      return chart;
}