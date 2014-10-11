var ready;
ready = function() {
var $bottomNavList = $( "#bottom-nav-ul" );
var $filter = $( "#filter" );
var $bottomNav = $( "#bottom-nav-bar" );
$filter.on( "click" , toggelBottomNav );
var toggle = 0;

function toggelBottomNav() {
  if ( toggle == 0 ) {
    popBottomNav()
    $bottomNav.removeClass( "nav-extension-hide" );
    $bottomNav.addClass( "nav-extension-show");
    $filter.addClass( "active" );
    toggle = 1;
  } else {
    $bottomNav.removeClass( "nav-extension-show" );
    $bottomNav.addClass( "nav-extension-hide" );
    $filter.removeClass( "active" );
    toggle = 0;
  }

};

function popBottomNav() {
      $bottomNavList.empty();
      letter = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
      letter.forEach(function(entry) {
        $bottomNavList.append('<li class=letters><a href="/?search='+entry+'"><div class="btn-group letters">' +entry+ '</div></a></li>');
      });
}
};
$(document).ready(ready);
$(document).on( "page:change" , ready);
