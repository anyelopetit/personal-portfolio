$(document).ready(function () {
  setTimeout(function () {
    $('.preloader').fadeOut(2000);
  }, 2000)

  navScroll()

  $(this).scroll(function () {
    navScroll()
    activeNav()
    animateInScroll()
  })

  $('nav a').click(function (e) {
    scrollToSection(e)
  })

  toggleMenu($('.toggle-menu'))

  parallax($('.main-text'))

  carousel3d('.testimonials')
  carousel3d('.certificates')
});

function navScroll() {
  if ($(this).scrollTop() > 50) {
    $('#navbar').addClass('sticked')
  } else {
    $('#navbar').removeClass('sticked')
  }
}

function activeNav() {
  for (var i = 0; i < ($('nav a').length); i++) {
    hash = $('nav a')[i].hash
    if (($(document).scrollTop() + 310) > ($(hash).offset().top)) {
      $('nav a').removeClass('active')
      $('nav a')[i].classList.add('active');
    }
  }
}

function toggleMenu(elem) {
  elem.click(function () {
    $(this).toggleClass('close-menu');
    $('#navbar').toggleClass('displayed');
    $('section').toggleClass('blur')
  })
}

function parallaxOnMouseMove(elem) {
  elem.closest('section').mousemove(function (event) {
    elem.closest('section').css({
      'background-position': `${(($(window).width() / 2) - event.pageX) * .002}px, ${(($(window).width() / 2) - event.pageY) * .002}px`
    })
    elem.css({
      transform: `translate(${(($(window).width() / 2) - event.pageX) * .005}px, ${(($(window).width() / 2) - event.pageY) * .005}px)`
    })
  })
}

function parallax($object, multiplier) {
  var event_pageX = 0;
  var event_pageY = 0;

  $object.closest('section').css({ 'background-attatchment': 'fixed' });
  $object.closest('section').mousemove(function (event) {
    event_pageX = event.pageX;
    event_pageY = event.pageY;
    $object.closest('section').css({
      'background-position': bg_css(event_pageX, event_pageY, multiplier, .002)
    })
    $object.css({
      transform: `translate(${bg_css(event_pageX, event_pageY, multiplier, .005)})`
    })
  })

  $(window).scroll(function () {
    $object.closest('section').css({
      'background-position': bg_css(event_pageX, event_pageY, multiplier, .002)
    });

    $object.css({
      transform: `translate(${bg_css(event_pageX, event_pageY, multiplier, .005)})`
    })
  });
}

function bg_css(event_pageX, event_pageY, multiplier, percentage) {
  multiplier = typeof multiplier !== 'undefined' ? multiplier : 0.5;
  multiplier = 1 - multiplier;
  var $doc = $(document);
  var from_top = $doc.scrollTop();
  var x = (($(window).width() / 2) - event_pageX) * percentage;
  var y = (($(window).width() / 2) - event_pageY) * percentage;
  var parallax = (multiplier * from_top);
  return `${x}px ${parallax}px, ${y}px ${parallax}px`
}

function animateInScroll() {
  for (var i = 0; i < ($('.animate').length); i++) {
    if ($(document).scrollTop() + 500 > $('.animate').offset().top) {
      $('.animate')[i].classList.replace('animate', 'animated');
    }
  }
}

function scrollToSection(e) {
  e.preventDefault()
  sectionTop = (e.target.hash == '#about' ? 300 : 50)
  $(this).addClass('active')
  $('html, body').animate({
    scrollTop: $(e.target.hash).offset().top - sectionTop
  }, 1000);
}

function carousel3d(carousel) {
  $(carousel + '.carousel .prev').click(function () {
    prev = $(carousel + ' .item.active.rotate').prev()
    if (prev.length == 0) moveCarousel(carousel, $(carousel + ' .item').last())
    else moveCarousel(carousel, prev)
  })
  $(carousel + '.carousel .next').click(function () {
    next = $(carousel + ' .item.active.rotate').next()
    if (next.length == 0) moveCarousel(carousel, $(carousel + ' .item').first())
    else moveCarousel(carousel, next)
  })
  $(carousel + ' .item').click(function (event) {
    moveCarousel(carousel, $(event.currentTarget))
  })
}

function moveCarousel(carousel, element) {
  $(carousel + ' .item').removeClass('active rotate')
  element.addClass('active')
  var width = 0;
  var active = false;
  $(carousel + ' .item').toArray().forEach(function (elem) {
    if (elem.classList.contains('active')) active = true;
    else if (!active) width += elem.clientWidth + 10
  })
  $(carousel + ' .item').animate({
    left: `-${width}px`
  }, 500);
  $(carousel + ' .item.active').addClass('rotate')
}
