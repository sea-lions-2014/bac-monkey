// this polutes the global namespace...booo
function signInEvents(){
  $('#signin').click(function(e){
      e.preventDefault();
      $('.signin_form').toggleClass('hidden');
    })
}
