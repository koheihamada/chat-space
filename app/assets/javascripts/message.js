$(document).on ('turbolinks:load', function(){



  function buildHTML(message){
    var image = message.image
    if (image !== null) {
      var html = `<div class= "text"><h1>${message.name}
                  </h1>
                  <h2> ${message.created_at}
                    </h2>
                    <div class= "message">
                      <h3>${message.body}
                        </h3>
                    </div>
                    <img alt="${message.image}" src="${message.image}" />
                    </div>`
                    return html
    } else{
    var html = `<div class= "text"><h1>${message.name}
                  </h1>
                  <h2> ${message.created_at}
                    </h2>
                    <div class= "message">
                      <h3>${message.body}
                        </h3>
                    </div>
                    </div>`
                    return html
    }
  }

  $('.new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.right-content__middle').append(html)
      $('.send').attr('disabled', false);
      $('#message_body').val('')
      $('.right-content__middle').append(html)
      $('.right-content__middle').animate({scrollTop: $('.right-content__middle')[0].scrollHeight}, 'fast');
    })
    .fail(function(){
      alert('errorrr');
      // $('.send').attr('disabled', false);
    })
   });
});