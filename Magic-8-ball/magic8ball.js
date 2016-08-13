{
    var age= confirm("Are you at least 18?");
    if (age===true){
        alert("Welcome");
    }else{
        alert("You are being redirected to Disney.com");
        window.location = "http://www.disney.com";

    }
}
var gameMode = "questionMode"

function changeMode() {
  if (gameMode === "questionMode") { // changes from question mode to answer mode
    giveAnswer();
    gameMode = "answerMode";
    document.getElementById("button").value = "Ask another question";
    document.getElementById("question").className = "answerStyle";
    document.getElementById("question").disabled = true;
  }
  else {
    gameMode = "questionMode"; // changing from answermode to question mode
    document.getElementById("button").value = "Get an answer";
    document.getElementById("question").value = "";
    document.getElementById("question").className = "questionStyle";
    document.getElementById("question").disabled = false;

  }
}


function giveAnswer() { // start giveanswer function
  var answer=Math.floor(Math.random()*5)+1;
  // check question length
  if (document.getElementById("question").value.length < 7) {
    document.getElementById("question").value = "Enter a real question";
  }
  // check length question cont..
  else if (document.getElementById("question").value.length > 50) {
    document.getElementById("question").value = "Hmm... that's a really tough question. I think you may require professional help.";
  }
  // answer
  else {
    if (answer===1) {
      document.getElementById("question").value = "How DARE you ask me that. You should be ashamed.";
    } else if (answer===2) {
      document.getElementById("question").value = "Sorry, I wasn't paying attention. Try again.";
    } else if (answer===3) {
      document.getElementById("question").value = "My mind is telling me no, but my body, my body's telling me yes.";
    }  else if (answer===4) {
      document.getElementById("question").value = "I'm not telling you and you can't make me";
    } else {
      document.getElementById("question").value = "YAAAASSSS";
    }
  }
} // end giveanswer function
