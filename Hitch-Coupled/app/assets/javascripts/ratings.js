$(document).on('ready page:load', function(){
  
  ratingBindings();
})

var ratingBindings = function(){
	$('.starRating').on('click', rateStar)
}

var rateStar = function(){
	var thiss $(this)

	
	$.ajax({
		type: 'POST',
		url: '/ratings',
		data: $(this).parent().serialize(),
		dataType: 'JSON'
		}
	).done(function(data){
		debugger
		
		
		}
	).fail(function(data){
		
	})

}