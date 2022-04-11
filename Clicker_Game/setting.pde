void setting() {
  background(backgroundColour);
  image(back, 250, 275, 557, 696);
  settingsBase();
}

void settingsBase() {
  main.setGain(volume);
  for (int j = 0; j < soundEffects.length; j++) {
    soundEffects[j].setGain(volume2);
  }
  stroke(0);
  strokeWeight(3);
  stroke(0);
  fill(255);
  tactileRect(75, 505, 60, 20);
  rect(75, 505, 60, 20); //back button
  stroke(0);
  fill(255);
  rect(250, 235, 420, 245);
  line(50, 191, 450, 191);
  line(50, 277, 450, 277);
  noStroke();
  noFill();
  d = map(sliderX3, 180, 390, 30, 150); //size of target
  image(selectedTarget, 340, 450, d, d);
  volume = map(sliderX1, 180, 390, -35, 35);
  volume2 = map(sliderX2, 180, 390, -20, 20);
  
  stroke(0);
  fill(255);
  strokeWeight(1.5); //sliders bases
  rect(285, 138, 300, 35, 30);
  rect(285, 220, 300, 35, 30);
  rect(285, 305, 300, 35, 30);
  
 
  //muting and unmuting
  stroke(0);
  fill(255);
  tactileRect(435, 179, 15, 15);
  if (main.isMuted())
    fill(#DCF7E7);
  square(435, 179, 15);
  stroke(0);
  fill(255);
  tactileRect(435, 265, 15, 15);
  if (soundEffects[0].isMuted())
    fill(#DCF7E7);
  square(435, 265, 15);
  
  fill(0); //text
  textSize(60);
  text("Settings", 250, 60);
  textSize(30);
  text("BGM", 90, 136);
  text("SFX", 84, 218);
  text("Size", 85, 303);
  textSize(18);
  text("Adjusts the volume of the music", 180, 165);
  text("Adjusts the volume of the sound effects", 207, 250);
  text("Adjusts the size of the target/animal", 194, 335);
  textSize(20);
  text("Back", 75, 502);
  textSize(15);
  text("Mute", 405, 179);
  text("Mute", 405, 265);
  
  //details
  stroke(0);
  strokeWeight(3);
  line(180, 138, 390, 138);
  line(180, 220, 390, 220);
  line(180, 305, 390, 305);
  strokeWeight(1.5);
  fill(255);
  circle(155, 305, 23);
  circle(415, 305, 23);
  noStroke();
  fill(buttonColour);
  circle(155, 305, 5);
  fill(#AAEAC4);
  circle(415, 305, 22);
  stroke(0);
  fill(#DCF7E7);
  tactileSlider(sliderX1, 128, 148);
  circle(sliderX1, 138, 20);
  stroke(0);
  tactileSlider(sliderX2, 210, 230);
  circle(sliderX2, 220, 20);
  stroke(0);
  tactileSlider(sliderX3, 295, 315);
  circle(sliderX3, 305, 20);
}

void tactileSlider(float sliderX, int top, int bottom) {
  if (mouseX >= sliderX - 10 && mouseX <= sliderX + 10 && mouseY >= top && mouseY <= bottom) 
    stroke(buttonColour);
  else
    stroke(0);
}

float slider(float sliderX, int top, int bottom) {
  if (mouseX >= 180 && mouseX <= 390 && mouseY >= top && mouseY <= bottom) 
    sliderX = mouseX;
  return sliderX;
}

void settingsClicks() {
  if (mouseX >= 45 && mouseX <= 105 && mouseY >= 495 && mouseY <= 515) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    mode = INTRO;
  }
  sliderX1 = slider(sliderX1, 128, 148);
  if (mouseX >= 180 && mouseX <= 390 && mouseY >= 210 && mouseY <= 230){
    soundEffects[0].rewind();
    soundEffects[0].play();
    sliderX2 = mouseX;
  }
  sliderX3 = slider(sliderX3, 295, 315);
  if (mouseX >= 427.5 && mouseX <= 442.5 && mouseY >= 171.5 && mouseY <= 186) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    if (main.isMuted()) 
      main.unmute();
    else
      main.mute();
  }
  if (mouseX >= 427.5 && mouseX <= 442.5 && mouseY >= 257.5 && mouseY <= 272.5) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    if (soundEffects[0].isMuted()) {
      for (int j = 0; j < soundEffects.length; j++) {
        soundEffects[j].unmute();
      }
    }
    else {
      for (int j = 0; j < soundEffects.length; j++) {
        soundEffects[j].mute();
      }
    }
  }
}

void settingsClicksDrag() {
  sliderX1 = slider(sliderX1, 128, 148);
  if (mouseX >= 180 && mouseX <= 390 && mouseY >= 210 && mouseY <= 230){
    sliderX2 = mouseX;
  }
  sliderX3 = slider(sliderX3, 295, 315);
}
