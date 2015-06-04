$(document).on('ready page:load',function(){
  homeBindings();
  
});


function homeBindings(){
  $('#driver_pic').on('click', driverForm);


  $('nav').on('click', '#new_car_link', showCarForm);


  $('nav').on('submit', '#new_car', newCar)
}

var driverForm = function(event) {
	event.preventDefault()
	
	$(this).parent().parent().parent().slideUp()
	$('#hidden_form').slideToggle()

	$.ajax({
		url: '/trips/new',
		method: 'GET'
		
		}
	).done(function(data) {
		$('nav').append(data)
		console.log(data)
	})
}

var showCarForm = function(event) {
	event.preventDefault()
	$('#trip_new_car').slideToggle()
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
		}
	).fail(function(data) {
		console.log(data)
		$('#error').append('<li> FILL OUT ALL INPUTS </li>')
	})

}