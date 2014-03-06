function fixWebkitHeightBug(){
  var svgW = 658;
  var svgH = 500;
  var curSVGW = $('#floor').width();
  var newSVGH = heightInRatio(svgH,svgW,curSVGW);
  $('#floor').height(newSVGH);

  function heightInRatio(oH,oW,nW){
    return (oH / oW * nW);
  }
}

$(window).resize(function() {
  fixWebkitHeightBug();
});

$(function() {
  fixWebkitHeightBug();
});