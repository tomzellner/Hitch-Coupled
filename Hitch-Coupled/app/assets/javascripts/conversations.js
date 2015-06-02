$(document).ready(function(){
    eventBindings();
});

var eventBindings = function(){
  $('#new_message').on('submit', addMessage)
};

var addMessage = function(event){
      event.preventDefault();


      var data = $('#new_message').serialize();
      var url = $(this).attr("action");
      $('textarea#message_text').val("");

      var request = $.ajax({
        url: url,
        type: 'post',
        data: data,
        dataType: 'json'
      }).done(function(response){
        var source = $('#message-template').html();
        var template = Handlebars.compile(source);

        $('#message-container').append(template(response))
      })
}