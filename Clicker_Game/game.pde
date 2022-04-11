void game() {
  background(backgroundColour);
  image(back, 250, 275, 557, 696);
  stroke(0);
  strokeWeight(3);
  fill(255);
  image(selectedTarget, x, y, d, d);
  x += vx;
  y += vy;

  //bouncing
  if (x - d/2 <= 0 || x + d/2 >= 500)
    vx *= -1;
  if (y - d/2 <= 0 || y + d/2 >= 550)
    vy *= -1;

  gameBase();
}

void gameBase() {
  stroke(0);
  strokeWeight(3);
  fill(255);
  tactileRect(425, 505, 90, 35);
  rect(425, 505, 90, 35); //pause button

  textSize(60);
  fill(0);
  text("Click the Target", 250, 60);
  textSize(25);
  text("Score: " + score, 250, 110);
  textSize(30);
  text("Pause", 425, 500);
  text("Lives = " + lives, 75, 500);
}

//clicks -------------------------------------------------------------------------------
void gameClicks() {
  if (mouseX >= 380 && mouseX <= 470 && mouseY >= 487.5 && mouseY <= 522.5) {
    mode = PAUSE;
    soundEffects[0].rewind();
    soundEffects[0].play();
  } else if (dist(x, y, mouseX, mouseY) <= (d/2)) {
    soundEffects[2].rewind();
    soundEffects[2].play();
    score++;
    vy *= 1.1;
    vx *= 1.1;
  } else {
    soundEffects[1].rewind();
    soundEffects[1].play();
    lives--;
  }
  if (lives <= 0) {
    if (score >= highscore) {
      highscoreTrue = true;
      highscore = score;
      if (lives == 0) {
        soundEffects[3].rewind();
        soundEffects[3].play();
      }
    } else if (score < highscore) {
      highscoreTrue = false;
      soundEffects[4].rewind();
      soundEffects[4].play();
    }
    mode = GAMEOVER;
  }
}
