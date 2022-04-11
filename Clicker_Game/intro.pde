void intro() {
  background(backgroundColour);
  image(back, 250, 275, 557, 696);
  introBase();
}

void introBase() {
  strokeWeight(3);
  stroke(0);
  fill(255);
  circle(x2, y2, 50);
    
  strokeWeight(3);
  fill(255);
  stroke(0);
  tactileRect(250, 425, 350, 90);
  rect(250, 425, 350, 90); //START
  fill(255);
  stroke(0);
  tactileRect(160, 500, 160, 30);
  rect(160, 500, 160, 30); //SETTING
  fill(255);
  stroke(0);
  tactileRect(340, 500, 160, 30);
  rect(340, 500, 160, 30); //CUSTOMIZATION
  fill(255);
  stroke(0);
  rect(250, 70, 300, 80); //TITLE
  fill(255);
  stroke(0);
  image(selectedTarget, 250, 260, 200, 200);
  
  textSize(100);
  fill(0);
  text("START", 250, 410);
  textSize(70);
  text("Click It!", 250, 60);
  textSize(20);
  text("SETTINGS", 160, 498);
  text("CUSTOMIZATION", 340, 498);
  text("Highscore: " + highscore, 250, 125);
}

//clicks -------------------------------------------------------------------------------
void introClicks() {
  if (mouseX >= 75 && mouseX <= 425 && mouseY >= 380 && mouseY <= 470) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    mode = GAME;
  }
  if (mouseX >= 80 && mouseX <= 240 && mouseY >= 470 && mouseY <= 530) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    mode = SETTING;
  }
  if (mouseX >= 260 && mouseX <= 420 && mouseY >= 470 && mouseY <= 530) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    mode = SELECTION;
  }
}
