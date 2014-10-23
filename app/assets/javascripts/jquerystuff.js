
$(document).ready(function() {
  // $("#browse-div").hover(function () {
  //   $("#browse-dropdown").css("left", "0")
  // });
  //
  // $(".links").click(function () {
  //   $("#mobilenav").css("left", "-150")
  // });

    // $("#browse-div").hover(function () {
    // $("#browse-dropdown").slideToggle(600);
    // });
//
// $("#browse-div").hover(function () {
// $("#browse-dropdown").css("height", "auto");
// });

$("#browse-div").hover(function () {
$("#browse-dropdown").slideDown(600);
});

$(".sub-body").hover(function () {
$("#browse-dropdown").slideUp(600);
});


});

// $(document).ready(function(e) {
//     $('#slider-space').slides({
//         preload: true,
//         preloadImage: '/images/loading.gif',
//         play: 5000,
//         pause: 2500,
//         hoverPause: false,
//         pagination: true
//     });
// });
