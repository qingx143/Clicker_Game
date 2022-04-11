void gameover() {
  background(backgroundColour);
  image(back, 250, 275, 557, 696);
  gameoverBase();
  highscoreStuff();
}

void highscoreStuff() {
  if (highscoreTrue == true) {
    newHighscore();
    if (count <= 30)
      image(sheep1, 250, 265, 200, 200);
    else if (count <= 60)
      image(sheep2, 250, 265, 200, 200);
    else if (count <= 90)
      image(sheep3, 250, 265, 200, 200);
    else if (count <= 120)
      image(sheep4, 250, 265, 200, 200);
  }
  else if (highscoreTrue == false){
    image(sadPanda, 250, 265, 250, 250);
  }
}

void newHighscore() {
  noStroke();
  fill(255);
  ellipse(100, 150, 150, 75);
  triangle(125, 175, 175, 198, 150, 175);
  fill(0);
  textSize(17);
  text("NEW \n HIGHSCORE!!", 100, 145);
}

void gameoverBase() {
  stroke(0);
  strokeWeight(3);
  fill(255);
  tactileRect(250, 410, 230, 70);
  rect(250, 410, 230, 70); //try again
  stroke(0);
  fill(255);
  tactileRect(400, 495, 140, 40);
  rect(400, 495, 135, 40); //exit
  
  textSize(60);
  fill(0);
  text("Game Over", 250, 60);
  textSize(25);
  text("Highscore = " + highscore, 250, 110);
  text("Score = " + score, 250, 140);
  textSize(50);
  text("Try Again?", 250, 400);
  textSize(30);
  text("Exit Game", 400, 490); 
}

//clicks -------------------------------------------------------------------------------
void gameoverClicks() {
  if (mouseX >= 135 && mouseX <= 365 && mouseY >= 375 && mouseY <= 445){
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
  if (mouseX >= 330 && mouseX <= 470 && mouseY >= 475 && mouseY <= 515) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    exit();
  }
}
