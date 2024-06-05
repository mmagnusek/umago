// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import Rails from '@rails/ujs'
Rails.start();
import "controllers"
// import "@hotwired/turbo-rails"

// import "popper"
// import "bootstrap"
import "jquery"
import "bxslider"
import "fancybox"

$(function() {
  $('a.fancybox').fancybox();

  return $('.bx-slider').bxSlider({
    mode: 'fade',
    captions: true,
    pager: false,
    controls: false,
    auto: true
  });
});
