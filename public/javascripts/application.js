$(function() {
  sparkle1 = setInterval(hoverfade1, 5500);
  sparkle2 = setInterval(hoverfade2, 3500);
  sparkle3 = setInterval(hoverfade3, 8000);
  sparkle4 = setInterval(hoverfade4, 12000);
  sparkle5 = setInterval(hoverfade5, 6000);
  sparkle6 = setInterval(hoverfade6, 6500);
  function hoverfade1(){ $('div#star1').fadeOut(1000).fadeIn(1000); }
  function hoverfade2(){ $('div#star2').fadeOut(1500).fadeIn(1500); }
  function hoverfade3(){ $('div#star3').fadeOut(1200).fadeIn(1200); }
  function hoverfade4(){ $('div#star4').fadeOut(1500).fadeIn(1500); }
  function hoverfade5(){ $('div#star5').fadeOut(1500).fadeIn(1500); }
  function hoverfade6(){ $('div#star6').fadeOut(1500).fadeIn(1500); }
});

