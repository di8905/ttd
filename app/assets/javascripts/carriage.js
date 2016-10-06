$(document).ready(function() {
  var seats;
  var top_seats;
  var bottom_seats;
  var side_top_seats
  var side_bottom_seats;
  
  seats = $("div.seats");
  top_seats = $("div.top_seats");
  bottom_seats = $("div.bottom_seats");
  side_bottom_seats = $("div.side_bottom_seats");
  side_top_seats = $("div.side_top_seats");
  selector = $("select.type-select");
  
  var hide_fields = function() {
    seats.hide();
    top_seats.hide();
    bottom_seats.hide();
    side_top_seats.hide();
    side_bottom_seats.hide();
  };
    
  var set_fields = function(type) {
    switch(type) {
    case 'SeatCarriage':
    hide_fields();
    seats.show();
    break;
    
    case 'SvCarriage':
    hide_fields();
    bottom_seats.show();
    break;
    
    case 'EconomyCarriage':
    hide_fields();
    bottom_seats.show();
    top_seats.show();
    side_top_seats.show();
    side_bottom_seats.show();
    break;
    
    case 'CoupeCarriage':
    hide_fields();
    bottom_seats.show();
    top_seats.show();
    break;
    
  };
  };
  set_fields(selector.val());
  selector.change(function() {
    set_fields(selector.val());
  });
});
