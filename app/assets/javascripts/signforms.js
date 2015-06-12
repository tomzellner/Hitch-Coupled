$(document).on('ready page:load', function(){

  signBindings();
})

var signBindings = function() {
	$('#hidden_sign_up').on('click', showSignUp);

	$('#home_logo').on('click', slideForms)


	// $('#real-sign-in').on('submit', ajaxSignIn)



}

var showSignUp = function(event) {
	event.preventDefault()
	$('#sign-up-div').slideToggle()
	$('#sign-in-div').slideToggle()
	$('#sign-up-div').attr('id', 'sign-in-div')
	$('#sign-in-div').attr('id', 'sign-up-div')
}

var slideForms = function(event) {
	event.preventDefault()
	$('html, body').animate({
        scrollTop: $( '#sign-in-div' ).offset().top
    }, 500);
}

// var ajaxSignIn = function(event) {
// 	event.preventDefault()

// 	// debugger	

// 	$.ajax({
// 		URL: '/cars',
// 		Method: 'POST',
// 		data: $(this).serialize(),
// 		contentType: 'JSON'


// 		}
// 	).done(function(response) {
		
// 		console.log(response)


// 		$('#sign-forms').slideToggle()

// 		$('#story-collections').slideToggle()
// 	})


// }




