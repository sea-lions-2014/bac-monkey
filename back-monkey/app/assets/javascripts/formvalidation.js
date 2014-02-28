$(function(){
  eventListeners();
});

function eventListeners(){
  $('form').keyup(enableFormSubmit);
  $('form').click(enableFormSubmit);
}

function enableFormSubmit(){
  if (validateTextInputs() && validateRadioButton()){
    $('.submit input').removeAttr('disabled');
  }
  else
  {
    $('.submit input').attr('disabled', 'disabled');
  }
}

function validateTextInputs(){
  var valid = true;
  var inputs = $(':text');
  for (var i=0; i<inputs.length; i++){
    if (!parseInt(inputs[i].value)) {
      valid = false;
    }
  }
  return valid
}

function validateRadioButton(){
  var valid = false;
  var buttons = $(':radio');
  for (var i=0; i<buttons.length; i++){
    if (buttons[i].checked){
      valid = true;
    }
  }
  return valid
}