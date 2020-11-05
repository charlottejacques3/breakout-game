void gameOver() {
  music.pause();
  background(#CE6262);

  //game over text
  textSize(130);
  if (lives <= 0) {
    text("YOU LOST!", width/2, 150);
    loseGame.play();
  }
  if (score >= arrayLength) {
    text("YOU WON!!!", width/2, 150);
    winGame.play();
  }

  //score
  textSize(30);
  text("SCORE: " + score, width/2, 260);

  //high score
  text("HIGH SCORE: " + highScore, width/2, 300);
  if (score > highScore) highScore = score;

  //play again button
  tactileRect(150, 450, 200, 100);
  fill(0);
  stroke(0);
  textSize(45);
  text("REPLAY", 250, 500);

  //quit button
  tactileRect(450, 450, 200, 100);
  fill(0);
  text("QUIT", 550, 500);
}

void gameOverClicks() {

  //replay button
  if (mouseX > 150 && mouseX < 350 && mouseY > 450 && mouseY < 550) {
    mode = INTRO;
    score = 0;
    lives = 3;
    paddleX = width/2;
    int i = 0;
    while (i < arrayLength) {
      alive[i] = true;
      i++;
      music.rewind();
    }
  }

  //quit button
  if (mouseX > 450 && mouseX < 650 && mouseY > 450 && mouseY < 550) exit();
}
