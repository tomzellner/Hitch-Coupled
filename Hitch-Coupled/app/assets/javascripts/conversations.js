$(document).ready(function(){
  $('#new_message').on('submit', function(event){
      event.preventDefault();
      var data = $('#new_message').serialize();
      var url = $(this).attr("action")
      debugger
      var request = $.ajax({
      })
  })
});
