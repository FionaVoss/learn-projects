var counter = 7;
var secretNumber = Math.floor(Math.random() * (100) + 1);
var playerName = "";
var wins = 0;
var losses = 0;
$(document).ready(function() {

 // $("#revealNumber").text(secretNumber);
 $("#submitButton").on("click", function() {
   if (playerName === ""){
     playerName = $("#inputBox").val();
     $("#gameMessage").text("Welcome, " + playerName + ". Enter a number between 1 and 100.");
     $("#inputBox").val("");
     $("#guessesLeft").text("You have " + counter + " guesses left.");
   } else {
    var userGuess = parseInt($("#inputBox").val());
    if (userGuess === secretNumber && counter > 1) {
      $("#gameMessage").text("You Win!");
      $("#guessesLeft").text("");
      $("#newGameButton").show();
      $("#submitButton").hide();
      wins ++;
      $("#scoreboard").text(playerName + ": " + wins + " Computer: " + losses);

    }
    else if (userGuess > secretNumber && counter > 1) {
      $("#gameMessage").text("Too High! Guess again.");
      counter--;
      $("#guessesLeft").text("You have " + counter + " guesses left.");
    }
    else if (userGuess < secretNumber && counter > 1) {
      $("#gameMessage").text("Too Low! Guess again.");
      counter--;
      $("#guessesLeft").text("You have " + counter + " guesses left.");
    }
    else {
      $("#gameMessage").text("You Lose!");
      $("#guessesLeft").text("You ran out of guesses!");
      $("#newGameButton").show();
      $("#submitButton").hide();
      losses ++;
      $("#scoreboard").text(playerName + ": " + wins + " Computer: " + losses);


    }
  }
 })
 $("#newGameButton").on("click", function() {
   secretNumber = Math.floor(Math.random() * (100) + 1);
   counter = 7;
   $("#gameMessage").text("OK, " + playerName + ". Enter a number between 1 and 100.");
   $("#guessesLeft").text("You have " + counter + " guesses left.");
   $("#inputBox").val("");
  //  $("#revealNumber").text(secretNumber);
   $("#submitButton").show();
   $("#newGameButton").hide();

 })
})
