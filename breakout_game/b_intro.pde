void intro() {
  gif();
  
  //title
  textSize(120);
  fill(#F05454);
  text("BREA      KOUT", width/2, height/4);
  
  //play button
  tactileRect(300, 450, 200, 100);
  fill(#AF2D2D);
  textSize(55);
  text("PLAY", width/2, 500);
}

void introClicks() {
  
  //start game
  if (mouseX > 300 && mouseX < 500 && mouseY > 450 && mouseY < 550) mode = GAME;
}
