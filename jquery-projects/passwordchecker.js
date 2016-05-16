function checkIfSame(user, pass) {
  if (user != pass){
    return {valid: true};
  } else {
    return {valid: false, reason: "Username and password cannot be the same."};
  }
}

function longEnough(user, pass) {
  if (user.length >= 6 && pass.length >= 6) {
    return {valid: true};
  } else {
    return { valid: false, reason: "Username and password must have at least 6 characters each."};
  }
}

function userContainChar(user) {
  if (!user.includes("!") && !user.includes("#") && !user.includes("$")) {
    return {valid: true};
  }
  else {
    return {valid: false, reason: "Username cannot include the following characters: !, #, $."};
  }
}

function pwSymbol(pw) {
  if (pw.includes("!") || pw.includes("#") || pw.includes("$")) {
    return { valid: true };
  }
  else {
    return { valid: false, reason: "There must be a special character in the password"};
  }
}

function pwSame(pw) {
  if (pw != "password") {
    return { valid: true };
  }
  else {
    return { valid: false, reason:"Password cannot be Password"}
  }
}



// alert("Your js is running");
$(document).ready(function() { //begin doc ready

  $("#submitButton").on("click", function() {
    $("#reasonList").text("");
    var user = $("#usernameInput").val();
    var pass = $("#passwordInput").val();   
      if (checkIfSame(user, pass).valid && longEnough(user, pass).valid && userContainChar(user).valid && pwSymbol(pass).valid && pwSame(pass).valid) {
        $("#message").text("Access Granted.");
      }
      else {
        $("#message").text("Access Denied.");
      }
      if (checkIfSame(user,pass).valid === false) {
        $("#reasonList").append("<li>" + checkIfSame(user, pass).reason + "</li>");
      }
      if (longEnough(user,pass).valid === false) {
        $("#reasonList").append("<li>" + longEnough(user, pass).reason + "</li>");
      }
      if (userContainChar(user).valid === false) {
        $("#reasonList").append("<li>" + userContainChar(user).reason + "</li>");
      }
      if (pwSymbol(pass).valid === false) {
        $("#reasonList").append("<li>" + pwSymbol(pass).reason + "</li>");
      }
      if (pwSame(pass).valid === false) {
        $("#reasonList").append("<li>" + pwSame(pass).reason + "</li>");
      }
    })            
  }); //end doc ready
// alert("Your js has run");
