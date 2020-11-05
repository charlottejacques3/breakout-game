void pause() {
  image(gif[0], 0, 0, width, height);
  textSize(100);
  text("GAME PAUSED", width/2, 200);
  
  //play button
  tactileCircle(750, 50, 25);
  fill(#AF2D2D);
  strokeWeight(1);
  triangle(743, 30, 743, 70, 763, 50);
}

void pauseClicks() {
  if(dist(mouseX, mouseY, 750, 50) < 25) {
    mode = GAME;
  }
}
