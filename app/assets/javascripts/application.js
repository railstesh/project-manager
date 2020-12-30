// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require select2
//= require turbolinks
//= require bootstrap-sprockets
//= require cocoon
//= require_tree .

$(function() {
    var flashCallback;
    flashCallback = function() {
        return $(".alert").fadeOut();
    };
    $(".alert").bind('click', (function(_this) {
        return function(ev) {
            return $(".alert").fadeOut();
        };
    })(this));
    return setTimeout(flashCallback, 2000);
});

$(document).on('turbolinks:load', function() {
  $(".select2").select2({
    allowClear: true,
    theme: "bootstrap"
  });
});

$(document).on('ready', function(){
  var reloadWithTurbolinks = (function () {
    var scrollPosition

    function reload () {
      scrollPosition = [window.scrollX, window.scrollY]
      Turbolinks.visit(window.location.toString(), { action: 'replace' })
    }

    document.addEventListener('turbolinks:load', function () {
      if (scrollPosition) {
        window.scrollTo.apply(window, scrollPosition)
        scrollPosition = null
      }
    })

    return reload
  })()

  $(".create-modal").click(function(e){
    $( ".simple_form" ).each(function(fIndex, form) {
      $(form).find(".form-control").each(function(index, input){
        $(input).val('')
      });
    });
  })

  var modal = document.getElementById("myModal");
  var btn = document.getElementById("myBtn");
  var span = document.getElementsByClassName("close")[0];
  btn.onclick = function() {
    modal.style.display = "block";
  }
  span.onclick = function() {
    modal.style.display = "none";
  }
  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }

  var modal1 = document.getElementById("myModal1");
  var btn1 = document.getElementById("myBtn1");
  var span1 = document.getElementsByClassName("close1")[0];
  btn1.onclick = function() {
    modal1.style.display = "block";
  }
  span1.onclick = function() {
    modal1.style.display = "none";
    location.reload();
  }
  window.onclick = function(event) {
    if (event.target == modal1) {
      modal1.style.display = "none";
    }
  }
});
