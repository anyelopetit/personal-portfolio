// Keppler - index.js file
$(document).ready(function(){
  setTimeout(function(){
    $('.preloader').fadeOut(2000);
  }, 2000)

  navScroll()

  $(this).scroll(function() {
    navScroll()
    activeNav()
    animateInScroll()
  })

  $('nav a').click(function(e) {
    scrollToSection(e)
	})

  toggleMenu($('.toggle-menu'))

  parallaxOnMouseMove($('.main-text'))

  testimonialCarousel()
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
    if ($(document).scrollTop()+310 > $(hash).offset().top) {
      $('nav a').removeClass('active')
      $('nav a')[i].classList.add('active');
    }
	}
}

function toggleMenu(elem) {
  elem.click(function() {
    $(this).toggleClass('close-menu');
    $('#navbar').toggleClass('displayed');
    $('section').toggleClass('blur')
  })
}

function parallaxOnMouseMove(elem) {
  elem.closest('section').mousemove(function( event ) {
    elem.closest('section').css({
      'background-position': `${(($(window).width()/2)-event.pageX)*.005}px, ${(($(window).width()/2)-event.pageY)*.005}px`
    })
    // console.log((($(window).width()/2)-event.pageX))
    // console.log(elem.closest('section').width())
    console.log($(window).width())
    elem.css({
      transform: `translate(${(($(window).width()/2)-event.pageX)*.03}px, ${(($(window).width()/2)-event.pageY)*.03}px)`
    })
  })
}

function animateInScroll() {
  for (var i = 0; i < ($('.animate').length); i++) {
    if ($(document).scrollTop()+500 > $('.animate').offset().top) {
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

function testimonialCarousel() {
  $('.carousel .prev').click(function() {
    prev = $('.testimonial.active.rotate').prev()
    if (prev.length == 0) moveCarousel($('.testimonial').last())
    else moveCarousel(prev)
  })
  $('.carousel .next').click(function() {
    next = $('.testimonial.active.rotate').next()
    if (next.length == 0) moveCarousel($('.testimonial').first())
    else moveCarousel(next)
  })
  $('.testimonial').click(function(event) {
    moveCarousel($(event.currentTarget))
  })
}

function moveCarousel(element) {
  $('.testimonial').removeClass('active rotate')
  element.addClass('active')
  var width = 0;
  var active = false;
  $('.testimonial').toArray().forEach(function(elem) {
    if (elem.classList.contains('active')) active = true;
    else if (!active) width += elem.clientWidth + 10
  })
  $('.testimonial').animate({
    left: `-${width}px`
  }, 500);
  $('.testimonial.active').addClass('rotate')
}
