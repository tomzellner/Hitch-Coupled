$(document).ready(tripShowBindings)

$(document).on('page:load', function(){
  
  tripShowBindings();
})

var tripShowBindings = (function (){
	


	var startGeo = $('#start_geog').attr('class').replace('[', '').replace(']', '').split(',')
	var endGeo = $('#end_geog').attr('class').replace('[', '').replace(']', '').split(',')


	var directionsDisplay = new google.maps.DirectionsRenderer();
	var directionsService = new google.maps.DirectionsService();

	function calcRoute() {
	  var origin      = new google.maps.LatLng(startGeo[0], startGeo[1]);
	  var destination = new google.maps.LatLng(endGeo[0], endGeo[1]);
	  var request = {
	      origin:      origin,
	      destination: destination,
	      travelMode:  google.maps.TravelMode.DRIVING
	  };
	  directionsService.route(request, function(response, status) {
	    if (status == google.maps.DirectionsStatus.OK) {
	      directionsDisplay.setDirections(response);
	    }
	  });
	}

	calcRoute();

	var handler = Gmaps.build('Google');
	handler.buildMap({ internal: {id: 'directions'}}, function(){
	  directionsDisplay.setMap(handler.getMap());

	});

})


