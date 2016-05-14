var secretNumber = Math.floor(Math.random() * 100) + 1;
document.getElementById("numberParagraph").innerHTML = secretNumber;

function changeNumber() {
  document.getElementById("guessInput").value = secretNumber;
}

function checkGuess() {
  userGuess = parseInt(document.getElementById("guessInput").value);
  if (userGuess > secretNumber) {
    document.getElementById("gameMessage").innerHTML = "Too high. Guess again!";
  }
  else if (userGuess < secretNumber) {
    document.getElementById("gameMessage").innerHTML = "Too low. Guess again!"
  }
  else {
    document.getElementById("gameMessage").innerHTML = "Great job! " + secretNumber + " is correct!";
    // document.getElementById("gameButton").onclick = startNewGame();
    // document.getElementById("gameButton").value = "Play Again";
    document.getElementById("guessInput").value = "";

  }
}

function startNewGame() {
  secretNumber = Math.floor(Math.random() * 100) + 1;
  // document.getElementById("gameButton").onclick = checkGuess();
  // document.getElementById("gameButton").value = "Guess";
  document.getElementById("gameMessage").innerHTML = "Enter a number between 1 and 100";
  document.getElementById("numberParagraph").innerHTML = secretNumber;

}
