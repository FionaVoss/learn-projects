var speed = 0;

function accelerate() {
  speed = speed + 10;
}

function brake() {
  speed = speed - 7;
}

// function updateStatus() {
//   return "You are driving a " + color + " " + year + " " + make + " " + model + " at " + speed + " miles per hour."
// }

$(document).ready(function() {
  function statusUpdate() {
    $("#status").text("You are driving a " + $("#colorInput").val() + " " + $("#yearInput").val() + " " + $("#makeInput").val() + " " + $("#modelInput").val() + " at " + speed + " miles per hour.");
  };
 $("#beginButton").on("click", statusUpdate);
 $("#accelerateButton").on("click", function () {
   accelerate();
   statusUpdate();
 });
 $("#brakeButton").on("click", function () {
   brake();
   statusUpdate();
 });
})
