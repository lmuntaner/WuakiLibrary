$(function () {

  $("#new_user").on("submit", function (event) {
    removeErrors();
    var userParams = $(event.currentTarget).serializeJSON().user;
    var wrongParams = [];
    Object.keys(userParams).forEach(function (userParam) {
      if (userParams[userParam] == '') {
        wrongParams.push(userParam)
      } else if (userParam == 'email' && !validateEmail(userParams[userParam])) {
        wrongParams.push(userParam)
      } else if (userParam == 'password' && userParams[userParam] != userParams["password_confirmation"]) {
        wrongParams.push(userParam);
        wrongParams.push('password_confirmation')
      }
    });
    if (wrongParams.length > 0) {
      event.preventDefault();
      showErrors(wrongParams);
    }
  });

  function validateEmail(email) {
		var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		return re.test(email)
  }

  function showErrors(wrongParams) {
    wrongParams.forEach(function (wrongParam) {
      $(`.${wrongParam}`).addClass('has-error');
    })
  }

  function removeErrors() {
    $('.form-group').removeClass('has-error');
  }
})
