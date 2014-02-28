

// function myData() {
//     var series1 = [];
//     var series2 = [];
//     for(var i =1; i < 12; i ++) {
//         series1.push({
//             x: i, y: i*2
//         });
//         series2.push({
//           x: i, y: (100 * i)/10
//         });
//     }

//     return [
//         {
//             key: "Series #1",
//             values: series1,
//             color: "#0000ff"
//         },
//         {
//           key: "Series #2",
//           values: series2,
//           color: "#222"
//         }
//     ];
// }


function generateSample(decayRate){
  var dataObj = []
  var substance = 1

  for(var i =0; i<12; i+=0.25){
    dataObj.push({x: i*60, y: substance})
    substance *= substance * decayRate
  }
  return dataObj
}
var sampleData = generateSample(0.99)
var sampleData2 = generateSample(0.93)
var sampleData3 = generateSample(0.91)

var dataObj = [
  {
    key: "BAC",
    values: sampleData,
    color: 'yellow'
  },
  {
    key: "Caffeine",
    values: sampleData2,
    color: 'red'
  },
  {
    key: "THC",
    values: sampleData3,
    color: 'green'
  }
]


nv.addGraph(function() {
    var chart = nv.models.lineChart()
                .margin({left: 100})  //Adjust chart margins to give the x-axis some breathing room.
                .useInteractiveGuideline(true)  //We want nice looking tooltips and a guideline!
                .transitionDuration(350)  //how fast do you want the lines to transition?
                .showLegend(true)       //Show the legend, allowing users to turn on/off line series.
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

    chart.forceY([0,0.8])

    d3.select("svg")
        .datum(dataObj)
        .transition().duration(500).call(chart);

    nv.utils.windowResize(
            function() {
                chart.update();
            }
        );

    return chart;
});