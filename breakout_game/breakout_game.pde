//Charlotte Jacques
//Block 1-2 B

//mimim imports
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//mode variables
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//gif variables
PImage[] gif;
int frame;

//font variables
PFont retronoid;

//sound variables
Minim minim;
AudioPlayer music, paddle, wall, scorePoint, losePoint, winGame, loseGame;

//score variables
int score, highScore, lives;

//keyboard variables 
boolean rightKey, leftKey;

//brick variables
int[] brickX, brickY;
int brickD;
int tempX, tempY;
int arrayLength;
boolean[] alive;

//brick colour variable
color[] colour;
int colourNum;

//paddle variables
float paddleX, paddleD;

//ball variables
float ballX, ballY, ballD, vx, vy;

//timer variable
int timer;

void setup() {
  size(800, 600);
  mode = INTRO;
  textAlign(CENTER, CENTER);

  //font variable
  retronoid = createFont("Retronoid.ttf", 100);
  textFont(retronoid);
  
  //sound variables
  minim = new Minim(this);
  music = minim.loadFile("theme music.mp3");
  music.loop();
  paddle = minim.loadFile("paddle.wav");
  wall = minim.loadFile("wall.wav");
  scorePoint = minim.loadFile("score.mp3");
  losePoint = minim.loadFile("failure.wav");
  winGame = minim.loadFile("clapping.wav");
  loseGame = minim.loadFile("lose.wav");
  
  //gif variables
  gif = new PImage[6];
  
  int n = 0;
  while(n < 6) {
    gif[n] = loadImage("frame_" + n + "_delay-0.12s.gif");
    n++;
  }

  //score variables
  score = 0;
  highScore = 0;
  lives = 3;

  //keyboard variables
  rightKey = false;
  leftKey = false;

  //brick colour variables
  colour = new color[6];
  colour[0] = #DE3163;
  colour[1] = #FE5BAC;
  colour[2] = #DE6FA1;
  colour[3] = #FE7F9C;
  colour[4] = #FDAB9F;
  //colour[5] = #FFD1D1;

  //brick variables
  arrayLength = 45;
  brickD = 50;
  tempX = 120;
  tempY = 120;

  brickX = new int[arrayLength];
  brickY = new int[arrayLength];
  alive = new boolean[arrayLength];

  int i = 0;
  while (i < arrayLength) {
    brickX[i] = tempX;
    brickY[i] = tempY;
    alive[i] = true;
    tempX += 70;
    if (tempX > 690) {
      tempX = 120;
      tempY += 70;
    }
    i++;
  }

  //paddle variables
  paddleX = width/2;
  paddleD = 80;

  //ball variables
  ballX = width/2;
  ballY = 500;
  ballD = 25;
  vx = 0;
  vy = 2;

  //timer variable
  timer = 100;
}

void draw() {
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
  else println("Error - mode = " + mode);
}
