$(function() {
  $("div#star1").mouseover(function() {
    sparkle1 = setInterval(hoverfade1, 5500);
    sparkle1 = setInterval(hoverfade2, 3500);
    sparkle1 = setInterval(hoverfade3, 8000);
    sparkle1 = setInterval(hoverfade4, 12000);
  });
  function hoverfade1(){ $('div#star1').fadeOut(1000).fadeIn(1000); }
  function hoverfade2(){ $('div#star2').fadeOut(1500).fadeIn(1500); }
  function hoverfade3(){ $('div#star3').fadeOut(1200).fadeIn(1200); }
  function hoverfade4(){ $('div#star4').fadeOut(1500).fadeIn(1500); }
});

