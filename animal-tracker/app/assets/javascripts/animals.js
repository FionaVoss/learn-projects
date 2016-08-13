
$("document").ready(function() {
  var new_animal_id = $("#new_animal_id").val();
  $("#add_new_animal_button").on(
    "click",
    function() {
      // Data to be submitted
      new_animal = {
        "animal": {
          "common_name": $("#animal_common_name").val(),
          "latin_name": $("#animal_latin_name").val(),
          "kingdom": $("#animal_kingdom").val(),
        }
      }


      $.ajax({
        dataType: 'json',
        url: '/animals',
        method: 'POST',
        data: new_animal,
        success: function(data) {
          add_to_animals_list(data)
        },
        error: function(jqXHR, textStatus, errorThrown) {
          alert("Add new wine failed: " + errorThrown);
        }
      });
      new_animal_id ++;

      $("#calendar").fullCalendar( 'refetchEvents' );
  });// end add animal



  $("#add_new_sighting_button").on(
    "click",
    function() {
      // Data to be submitted
      alert("test");
      new_sighting = {
        "sighting": {
          "latitude": $("#sighting_latitude").val(),
          "longitude": $("#sighting_longitude").val(),
          "date":
            $("#sighting_year").val() + "-" + $("#sighting_month").val() + "-" + $("#sighting_day").val() + " " + $("#sighting_hour").val() + ":" + $("#sighting_minute").val() + ":00 UTC",
          "animal_id": $("#sighting_animal_id").val()
        }
      }

      $.ajax({
        dataType: 'json',
        url: '/sightings',
        method: 'POST',
        data: new_sighting,
        success: function(data) {
          add_to_sightings_list(data);
        },
        error: function(jqXHR, textStatus, errorThrown) {
          alert("Add new sighting failed: " + errorThrown);
        }
      });
  });// end add sighting

}); // end document ready
// append new animal function
function add_to_animals_list(data) {
  $("#animals_list").append(
    "<tr><td>" + data.common_name +
    "</td><td>" + data.latin_name +
    "</td><td>" + data.kingdom +
    "</td><td><a href='/animals/" + data.id  + "'>Show</td><td><a href='/animals/" + data.id  + "/edit'>Edit</td><td><a data-confirm='Are you sure?' rel='nofollow' data-method='delete' href='/animals/" + data.id  + "'>Destroy</a></td></tr>");
  }

// append new sighting function
function add_to_sightings_list(data) {
  $("#sightings_list").append('<li><a href="' + '/sightings/' + data.id + '">' + data.date + "</a></li>");
}
