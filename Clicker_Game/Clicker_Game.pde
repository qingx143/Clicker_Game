/*
Zi Qing Xiong
2-4
March 28, 2022
Clicker Game
*/

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

int mode = 0;
final int INTRO = 1;
final int SELECTION = 2;
final int GAME = 3;
final int PAUSE = 4;
final int GAMEOVER = 5;
final int SETTING = 6;

//target -------------------------------------------------------------------------------
float x = 250;
float y = 275;
float d = 100;
float vx = random(-2, 2);
float vy = random(-2, 2);
float x2 = 250;
float y2 = 275;
float vx2 = random(-7, 7);
float vy2 = random(-7, 7);

//colours ------------------------------------------------------------------------------
color buttonColour = #2C6A44;
color backgroundColour = #FFF8E8;

//images -------------------------------------------------------------------------------
PImage back;
PImage selectedTarget;
PImage[] targets = new PImage[3];
PImage sheep1;
PImage sheep2;
PImage sheep3;
PImage sheep4;
PImage sadPanda;
PImage pauseCat;

//music --------------------------------------------------------------------------------
Minim minim;
AudioPlayer main;
AudioPlayer[] soundEffects = new AudioPlayer[5];
float volume = 0;
float volume2 = 0;

//other --------------------------------------------------------------------------------
int highscore = 0;
int score = 0;
int lives = 3;
int count = 0;
int i = 0;
float sliderX1 = 285;
float sliderX2 = 285;
float sliderX3 = 285;
boolean highscoreTrue;

void setup() {
  size(500, 550); //halfway mark = (250, 275)
  back = loadImage("Background.jpeg");
  targets[0] = loadImage("ProgrammerPanda.PNG");
  targets[1] = loadImage("RJ.PNG");
  targets[2] = loadImage("MCSheep.png");
  selectedTarget = targets[0];
  
  //animations
  sheep1 = loadImage("Sheep1.png");
  sheep2 = loadImage("Sheep2.png");
  sheep3 = loadImage("Sheep3.png");
  sheep4 = loadImage("Sheep4.png");
  sadPanda = loadImage("SadPanda.gif");
  pauseCat = loadImage("PausedCat.png");
  
  minim = new Minim(this);
  main = minim.loadFile("main.mp3");
  soundEffects[0] = minim.loadFile("buttonsClick.mp3"); 
  soundEffects[1] = minim.loadFile("missedTarget.mp3"); 
  soundEffects[2] = minim.loadFile("hitTarget.mp3"); 
  soundEffects[3] = minim.loadFile("newHighscore.mp3"); 
  soundEffects[4] = minim.loadFile("end.mp3");
  
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);
  mode = INTRO;
  main.loop();
}

void draw() { //not including bgm and sfx
  if (mode == INTRO) //complete
    intro();
  else if (mode == SELECTION) //add different targets
    selection();
  else if (mode == GAME) //complete
    game();
  else if (mode == PAUSE) //animation
    pause();
  else if (mode == GAMEOVER) //animation
    gameover();
  else if (mode == SETTING) 
    setting();
  else 
    println("Error: Mode = " + mode);
    
  if (targets[0] == selectedTarget)
    i = 0;
  else if (targets[1] == selectedTarget)
    i = 1;
  else if (targets[2] == selectedTarget)
    i = 2;
  else if (targets[3] == selectedTarget)
    i = 3;
  else if (targets[4] == selectedTarget)
    i = 4;
    
  //intro target
  x2 += vx2;
  y2 += vy2;  
  //bouncing
  if (x2 - 25 <= 0 || x2 + 25 >= 500)
    vx2 *= -1;
  if (y2 - 25 <= 0 || y2 + 25 >= 550)
    vy2 *= -1;
    
  count++;
  if (count >= 120)
    count = 0;
}

//tactile rectangular buttons ----------------------------------------------------------
void tactileRect(int x, int y, int w, int h) {
  if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) {
    stroke(buttonColour);
    fill(#F2FFF8);
  }
  else 
    stroke(0);
}
