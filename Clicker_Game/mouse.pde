void mouseReleased() {
  if (mode == INTRO)
    introClicks();
  else if (mode == SELECTION)
    selectionClicks();
  else if (mode == GAME)
    gameClicks();
  else if (mode == PAUSE) 
    pauseClicks();
  else if (mode == GAMEOVER) 
    gameoverClicks();
  else if (mode == SETTING)
    settingsClicks();
}

void mouseDragged() {
  if (mode == SETTING)
    settingsClicksDrag();
}
