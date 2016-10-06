$(document).ready(function() {
  $(".search-form").submit(function() {
    var departure_station;
    var destination_station;
    departure_station = $(this).find("#departure_station_id");
    destination_station = $(this).find("#destination_station_id");
    
    if (departure_station.val() == destination_station.val()) {
      alert("Начальная и конечная станции должны различаться!");
      return false;
    }
  })
});
