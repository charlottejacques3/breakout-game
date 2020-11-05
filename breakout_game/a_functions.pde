//MOUSE FUNCTIONS -----------------------------------------------------------------------

void mouseReleased() {
  if (mode == INTRO) introClicks();
  else if (mode == GAME) gameClicks();
  else if (mode == PAUSE) pauseClicks();
  else if (mode == GAMEOVER) gameOverClicks();
}

void mouseDragged() {
}

//KEYBOARD FUNCTIONS --------------------------------------------------------------------

void keyPressed() {
  if (keyCode == RIGHT) rightKey = true;
  if (keyCode == LEFT) leftKey = true;
}

void keyReleased() {
  if (keyCode == RIGHT) rightKey = false;
  if (keyCode == LEFT) leftKey = false;
}

//TACTILE FUNCTIONS ---------------------------------------------------------------------

void tactileRect(int x, int y, int w, int h) {

  //make it tactile
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    strokeWeight(5);
  } else {
    strokeWeight(1);
  }

  //regular button
  stroke(#AF2D2D);
  fill(#F05454);
  rect(x, y, w, h);
}

void tactileCircle(int x, int y, int r) {

  //make it tactile
  if (dist(mouseX, mouseY, x, y) < r) {
    stroke(#AF2D2D);
    strokeWeight(5);
  } else {
    strokeWeight(1);
  } 

  //regular button
  fill(255);
  circle(x, y, r*2);
}

//OTHER FUNCTIONS -----------------------------------------------------------------------

void bricks(int i) {
  //draw bricks
  if (brickY[i] == 120) fill(colour[0]);
  if (brickY[i] == 190) fill(colour[1]);
  if (brickY[i] == 260) fill(colour[2]);
  if (brickY[i] == 330) fill(colour[3]);
  if (brickY[i] == 400) fill(colour[4]);
  circle(brickX[i], brickY[i], brickD);

  //make bounce ball off bricks
  if (dist(ballX, ballY, brickX[i], brickY[i]) < brickD/2 + ballD/2) {
    vx = (ballX - brickX[i])/12; 
    vy = (ballY - brickY[i])/12;
    alive[i] = false;
    score++;
    scorePoint.rewind();
    scorePoint.play();
  }
}

void gif() {
  image(gif[frame], 0, 0, width, height);
  if (frameCount % 2 == 0) frame++;
  if (frame == 6) frame = 0;
}
