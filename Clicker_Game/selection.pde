void selection() {
  background(backgroundColour);
  image(back, 250, 275, 557, 696);
  selectionBase();
}

void selectionBase() {
  stroke(0);
  strokeWeight(3);
  fill(255);
  image(selectedTarget, 250, 250, 200, 200);
  rect(250, 420, 350, 80); //name
  stroke(0);
  fill(255);
  tactileRect(75, 505, 60, 20);
  rect(75, 505, 60, 20); //back button
  
  textSize(60);
  stroke(0);
  fill(0);
  text("Choose a Target", 250, 60);
  textSize(20);
  text("Back", 75, 502);
  textSize(40);
  if (selectedTarget == targets[0])
    text("Programmer Panda", 250, 415);
  if (selectedTarget == targets[1]) 
    text("Alpaca Alpaca", 250, 415);
  if (selectedTarget == targets[2]) 
    text("Gamer Sheep", 250, 415);
  
  fill(0);
  
  //buttons
  strokeWeight(3);
  fill(255);
  stroke(0);
  tactileRect(100, 250, 40, 90);
  rect(100, 250, 40, 90);
  stroke(0);
  fill(255);
  tactileRect(400, 250, 40, 90);
  rect(400, 250, 40, 90);
  noStroke();
  fill(#BCD3C7);
  triangle(90, 250, 110, 265, 110, 235); //arrows
  triangle(410, 250, 390, 265, 390, 235);
  
  //dots
  strokeWeight(1);
  stroke(0);
  fill(255);
  circleHighlights(0);
  circle(235, 372, 8);
  stroke(0);
  circleHighlights(1);
  circle(250, 372, 8);
  stroke(0);
  circleHighlights(2);
  circle(265, 372, 8);
}

void circleHighlights(int n) {
  if (targets[n] == selectedTarget)
    stroke(#BCD3C7);
  else
    stroke(0);
}

//clicks -------------------------------------------------------------------------------
void selectionClicks() {
  if (mouseX >= 45 && mouseX <= 105 && mouseY >= 495 && mouseY <= 515) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    mode = INTRO;
  }
  
  if (mouseX >= 80 && mouseX <= 120 && mouseY >= 205 && mouseY <= 295) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    if (targets[0] != selectedTarget)
      selectedTarget = targets[i-1];
    else
      selectedTarget = targets[0];
  }
  
  if (mouseX >= 380 && mouseX <= 420 && mouseY >= 205 && mouseY <= 295) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    if (targets[2] != selectedTarget)
      selectedTarget = targets[i+1];
    else 
      selectedTarget = targets[2];
  }
} 
