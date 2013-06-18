function resize() {
  $('iframe#content').height($(window).height() - $('#header').height() - 2);
}

$(function() {
    resize();
    $(window).resize(resize);

    $('#navigation').drags({handle:"h2"});
    $('#gleanings').drags({handle:"h2"});
});
