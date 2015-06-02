$(document).on('ready page:load',function(){
  searchBindings();
  
});

var searchBindings = function(){ 
	$('.container').on('click', '#show_form', showSearchForm);
	$('.container').on('click', '#hide_form', hideSearchForm);

	$('#new_search').on('submit', displaySearch);
}

var showSearchForm = function(event) {
	event.preventDefault()
	$('#search_div').toggle(true)
	$('#show_form').html('Hide Search')
	$('#show_form').attr('id', 'hide_form')
}
var hideSearchForm = function(event) {
	event.preventDefault()
	$('#search_div').toggle(false)
	$('#hide_form').html('Search Trips')
	$('#hide_form').attr('id', 'show_form')
}



var displaySearch = function(event) {
	var source = $('#trips-template').html();
  	var template = Handlebars.compile(source);

	event.preventDefault()
	var form = this
		
	$.ajax({
		url: '/searches',
		type: 'POST',
		data: $(this).serialize(),
		dataType: 'JSON'
		}
	).done(function(data){
		$('#search_div').toggle(false)
		var context = {trip: data};
		$('#all_trips div' ).empty();
		// debugger
		$('#all_trips').append(template(context));

		}
	).fail(function(data){
		
		}
	)
}