var secretNumber = Math.floor(Math.random() * 100) + 1;
document.getElementById("numberParagraph").innerHTML = secretNumber;
var guessesRemaining = 7;

function checkGuess() {
  userGuess = parseInt(document.getElementById("guessInput").value);
  if (userGuess > secretNumber) {
    document.getElementById("gameMessage").innerHTML = "Too high. Guess again!";
  }
  else if (userGuess < secretNumber) {
    document.getElementById("gameMessage").innerHTML = "Too low. Guess again!"
  }
  else if (userGuess === secretNumber){
    document.getElementById("gameMessage").innerHTML = "Great job! " + secretNumber + " is correct!";
    // document.getElementById("gameButton").onclick = startNewGame();
    // document.getElementById("gameButton").value = "Play Again";
    document.getElementById("guessInput").value = "";
    document.getElementById("gameButton").disabled = true;
  }
  if (guessesRemaining === 1) {
    if (userGuess === secretNumber) {
      document.getElementById("gameMessage").innerHTML = "Great job! " + secretNumber + " is correct!";
      // document.getElementById("gameButton").onclick = startNewGame();
      // document.getElementById("gameButton").value = "Play Again";
      document.getElementById("guessInput").value = "";
      document.getElementById("gameButton").disabled = true;
    }
    else {
      guessesRemaining --;
      document.getElementById("gameMessage").innerHTML = "You're out of guesses. You lose!";
      document.getElementById("guessesRemainingMessage").innerHTML = "Guesses Remaining: " + guessesRemaining;
      document.getElementById("gameButton").disabled = true;
    }
  }
  else {
    guessesRemaining --;
    document.getElementById("guessesRemainingMessage").innerHTML = "Guesses Remaining: " + guessesRemaining;
  }
}


function startNewGame() {
  secretNumber = Math.floor(Math.random() * 100) + 1;
  // document.getElementById("gameButton").onclick = checkGuess();
  // document.getElementById("gameButton").value = "Guess";
  document.getElementById("gameMessage").innerHTML = "Enter a number between 1 and 100";
  document.getElementById("numberParagraph").innerHTML = secretNumber;
  guessesRemaining = 7;
  document.getElementById("guessesRemainingMessage").innerHTML = "Guesses Remaining: " + guessesRemaining;
  document.getElementById("gameButton").disabled = false;
}
