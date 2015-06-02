$(document).on('ready page:load',function(){
  homeBindings();
  
});


function homeBindings(){
  $('#driver_pic').on('click', driverForm);


  $('#new_car_link').on('click', showCarForm);
  $('.car_form').on('submit', newCar)
}

var driverForm = function(event) {
	event.preventDefault()
	$('#homediv').remove('div')
	$('#hidden_form').show()
}

var showCarForm = function(event) {
	event.preventDefault()
	$('#trip_new_car').show()
}

var newCar = function(event) {
	event.preventDefault()
	var cForm = $(this)
	
	$.ajax({
		method: 'POST',
		data: $(this).serialize(),
		url: '/users/'+ $(this).attr('id') +'/cars',
		dataType: 'JSON'
		}
	).done(function(data) {
		console.log(data)
		$('#trip_car_id').append('<option value="'+data.id+'">'+data.make + ' ' + data.model + '</option>' )
		$('#trip_new_car').hide()
	})

}