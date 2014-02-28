// //create sample data
// function generateSample(decayRate){
//   var dataObj = []
//   var substance = 1

//   for(var i =0; i<12; i+=0.25){
//     dataObj.push({x: i*60, y: substance})
//     substance *= substance * decayRate
//   }
//   return dataObj
// }
// var sampleData = generateSample(0.99)
// var sampleData2 = generateSample(0.93)
// var sampleData3 = generateSample(0.91)

// var dataObj = [
//   {
//     key: "BAC",
//     values: sampleData,
//   },
//   {
//     key: "Caffeine",
//     values: sampleData2,
//   },
//   {
//     key: "THC",
//     values: sampleData3,
//   }
// ]

// var data = [[0, 0], [0.25, 0.0068], [0.5, 0.0136], [0.75, 0.0204], [1.0, 0.0272], [1.25, 0.0341], [1.5, 0.0409], [1.75, 0.0477], [2.0, 0.0545], [2.25, 0.0508], [2.5, 0.047], [2.75, 0.0432], [3.0, 0.0395], [3.25, 0.0358], [3.5, 0.032], [3.75, 0.0283], [4.0, 0.0245], [4.25, 0.0207], [4.5, 0.017], [4.75, 0.0133], [5.0, 0.0095], [5.25, 0.0057], [5.5, 0.002], [5.75, 0], [6.0, 0], [6.25, 0], [6.5, 0], [6.75, 0], [7.0, 0], [7.25, 0], [7.5, 0], [7.75, 0], [8.0, 0], [8.25, 0], [8.5, 0], [8.75, 0], [9.0, 0], [9.25, 0], [9.5, 0], [9.75, 0], [10.0, 0], [10.25, 0], [10.5, 0], [10.75, 0], [11.0, 0], [11.25, 0], [11.5, 0], [11.75, 0], [12.0, 0], [12.25, 0], [12.5, 0], [12.75, 0], [13.0, 0], [13.25, 0], [13.5, 0], [13.75, 0], [14.0, 0]]


// function formatData(data){
//   var values = []
//   for (var i =0; i<data.length;i++){
//     values.push({x: data[i][0] * 60, y: data[i][1]});
//   }
//   return values
// }

// var dataObj = [
//   {
//     key: "BAC",
//     values: formatData(data)
//   }
// ]

// var nullObj = [
//   {
//     values: [{}]
//   }
// ]

//Draw line chart
function drawChart(dataObj) {
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