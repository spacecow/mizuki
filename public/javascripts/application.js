$(function() {
  sparkle1 = setInterval(hoverfade1, 5500);
  sparkle2 = setInterval(hoverfade2, 11000);
  sparkle3 = setInterval(hoverfade3, 8000);
  sparkle4 = setInterval(hoverfade4, 11000);
  sparkle5 = setInterval(hoverfade5, 12000);
  sparkle6 = setInterval(hoverfade6, 12500);
  function hoverfade1(){ $('div#star1').fadeOut(1000).fadeIn(1000); }
  function hoverfade2(){ $('div#star2').fadeOut(1500).fadeIn(1500); }
  function hoverfade3(){ $('div#star3').fadeOut(1200).fadeIn(1200); }
  function hoverfade4(){ $('div#star4').fadeOut(1500).fadeIn(1500); }
  function hoverfade5(){ $('div#star5').fadeOut(1500).fadeIn(1500); }
  function hoverfade6(){ $('div#star6').fadeOut(1500).fadeIn(1500); }

  $("span#continue a").click(function() {
    $("ul#news_flow").fadeOut("slow");
    var id = this.toString().split("/")[3]+"/"+this.toString().split("/")[4]+".js";
    setTimeout(showEvent,2000,id);
    return false;
  });

  function showEvent(id) {
    $.getScript(id);
  }
});

