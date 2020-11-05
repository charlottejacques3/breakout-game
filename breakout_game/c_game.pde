void game() {
  background(#214252);
  winGame.rewind();
  loseGame.rewind();

  //pause button
  tactileCircle(750, 50, 25);
  fill(#AF2D2D);
  strokeWeight(1);
  rect(741.5, 32.5, 5, 35);
  rect(754.5, 32.5, 5, 35);

  //score + lives
  fill(#F05454);
  textSize(20);
  text("Score: " + score, width/2, 30);
  text("Lives: " + lives, width/2, 60);

  //bricks
  int i = 0;
  while (i < arrayLength) {
    if (alive[i] == true) {
      bricks(i);
    }
    i++;
  }

  //draw + move paddle
  fill(#F05454);
  circle(paddleX, height, paddleD);
  if (rightKey == true) paddleX += 4;
  if (leftKey == true) paddleX -= 4;

  //stop paddle from moving off screen
  if (paddleX < paddleD/2) paddleX = paddleD/2;
  if (paddleX > width - paddleD/2) paddleX = width - paddleD/2;
  
  //stop ball from moving off screen
  if (ballY < ballD/2) ballY = ballD/2;
  if (ballY > width-ballD/2) ballY = width-ballD/2;

  //draw + move ball
  circle(ballX, ballY, ballD);
  timer --;
  if (timer < 0) {
    ballX += vx;
    ballY += vy;
  }

  //bounce ball off wall
  if (ballX < ballD/2 || ballX > width - ballD/2) {
    vx = vx*-1;
    wall.rewind();
    wall.play();
  }
  if (ballY < ballD/2) {
    vy = vy*-1;
    wall.rewind();
    wall.play();
  }

  //bounce ball off paddle
  if (dist(ballX, ballY, paddleX, height) < paddleD/2 + ballD/2) {
    vx = (ballX - paddleX)/12; 
    vy = (ballY - height)/12;
    paddle.rewind();
    paddle.play();
  }

  //lose lives
  if (ballY > height - ballD/2) {
    lives--;
    timer = 100;
    timer--;
    paddleX = width/2;
    ballX = width/2;
    ballY = 500;
    vx = 0;
    vy = 2;
    losePoint.rewind();
    losePoint.play();
  }

  //game over
  if (lives <= 0) mode = GAMEOVER;
  if (score >= arrayLength) mode = GAMEOVER;
}

void gameClicks() {

  //pause button
  if (dist(mouseX, mouseY, 750, 50) < 25) mode = PAUSE;
}
