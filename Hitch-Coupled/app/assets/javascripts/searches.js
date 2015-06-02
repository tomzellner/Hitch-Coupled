$(document).on('ready page:load',function(){
  searchBindings();
  
});

var searchBindings = function(){ 
	$('#show_form').on('click', showSearchForm);
	$('#new_search').on('submit', displaySearch);
}

var showSearchForm = function(event) {
	event.preventDefault()
	$('#search_div').toggle(true)
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
		$('#all_trips').empty();
		debugger
		$('#all_trips').append(template(context));

		}
	).fail(function(data){
		
		}
	)
}