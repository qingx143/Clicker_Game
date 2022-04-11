void pause() {
  background(backgroundColour);
  image(back, 250, 275, 557, 696);
  pauseBase();
}

void pauseBase() {
  image(pauseCat, 250, 250, 250, 250);
  
  stroke(0);
  strokeWeight(3);
  fill(255);
  tactileRect(150, 425, 210, 50);
  rect(150, 425, 210, 50);
  stroke(0);
  fill(255);
  tactileRect(400, 490, 130, 30);
  rect(400, 490, 130, 30);
  
  textSize(60);
  fill(0);
  text("Paused", 250, 60);
  textSize(30);
  text("< Back to Game", 150, 420);
  textSize(25);
  text("End Game", 400, 485);
}

//clicks -------------------------------------------------------------------------------
void pauseClicks() {
  if (mouseX >= 45 && mouseX <= 255 && mouseY >= 400 && mouseY <= 450) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    mode = GAME;
  }
  
  if (mouseX >= 335 && mouseX <= 465 && mouseY >= 475 && mouseY <= 505) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    mode = INTRO;
    score = 0;
    lives = 3;
    x = 250;
    y = 275;
    vx = random(-2, 2);
    vy = random(-2, 2);
  }
}
