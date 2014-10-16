var ready;
ready = function() {
var $bottomNavList = $( "#bottom-nav-ul" );
var $comicSL = $("#comic-seach-link");
var $csl = $( "#character-search-link" );
var $bottomNav = $( "#bottom-nav-bar" );
$csl.on( "click" , popBottomNav );
$comicSL.on( "click", popComicBar );
letter = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
var toggle = 0;

function toggelBottomNav() {
  if ( toggle == 0 ) {
    $bottomNav.removeClass( "nav-extension-hide" );
    $bottomNav.addClass( "nav-extension-show");
    $csl.addClass( "active" );
    toggle = 1;
  } else {
    $bottomNav.removeClass( "nav-extension-show" );
    $bottomNav.addClass( "nav-extension-hide" );
    $csl.removeClass( "active" );
    toggle = 0;
  }

};

function popBottomNav() {
    if ( toggle == 0) {
      $bottomNav.removeClass( "nav-extension-hide" );
      $bottomNav.addClass( "nav-extension-show");
      $csl.addClass( "active" );
      $comicSL.removeClass( "active" );
      toggle = 1;
      $bottomNavList.empty();
      letter.forEach(function(entry) {
        $bottomNavList.append('<li class=letters><a href="/?letter='+entry+'"><div class="btn-group letters">' +entry+ '</div></a></li>');
      });
    } else {
      $bottomNav.removeClass( "nav-extension-show" );
      $bottomNav.addClass( "nav-extension-hide" );
      $comicSL.removeClass( "active" );
      $csl.removeClass( "active" );
      toggle = 0;
    }
}

function popComicBar() {
    if ( toggle == 0) {
      $bottomNav.removeClass( "nav-extension-hide" );
      $bottomNav.addClass( "nav-extension-show");
      $comicSL.addClass( "active" );
      $csl.removeClass( "active" );
      toggle = 1;
      $bottomNavList.empty();
      letter.forEach(function(entry) {
        $bottomNavList.append('<li class=letters><a href="/comics/?letter='+entry+'"><div class="btn-group letters">' +entry+ '</div></a></li>');
      });
    } else {
      $bottomNav.removeClass( "nav-extension-show" );
      $bottomNav.addClass( "nav-extension-hide" );
      $comicSL.removeClass( "active" );
      $csl.removeClass( "active" );
      toggle = 0;
    }
}


};
$(document).ready(ready);
$(document).on( "page:change" , ready);
