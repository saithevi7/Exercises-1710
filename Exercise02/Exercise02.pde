PImage img1, img2, img3, img4;
Stage stage;

/*  
collision handling code example used from the lecture and example
from https://processing.org/examples/bounce.html 
*/

// variables for Black Mage
int size = 80;

float posX, posY;

float speedX = 4;
float speedY = 4;

float directionX = 1;
float directionY = 1;

// Variables for Smash Ball
int ball_size = 80;

float ball_posX, ball_posY;

float ball_speedX = 2;
float ball_speedY = 2;

float ball_directionX = 1;
float ball_directionY = 1;

// Variables for Kirby
int size2 = 70;

float pos2X;

float speed2X = 4;

float direction2X = 1;



void setup() {
size(800, 600, P2D);
frameRate(60);

posX = 150;
posY = 360;

ball_posX = random(800);
ball_posY = random(600);

pos2X = 300;

stage = new Stage();

img1 = loadImage("Bmmain.gif");
img2 = loadImage("Smash_ball.png");
img3 = loadImage("kirby.png");
img4 = loadImage("galaxy.jpg");

}

void draw() {
 image(img4, 0, 0, width, height); 

 stage.draw();

 // Collision handling for Black Mage
 posX = posX + (speedX * directionX);
 posY = posY + (speedY * directionY);
 
 if (posX > width-size || posX < 0) {
     directionX *= -1; 
 }
 if (posY > height-200 || posY < 0) {
     directionY *= -1;
 }
 
 // Collision handling for the Smash Ball
 ball_posX = ball_posX + (ball_speedX * ball_directionX);
 ball_posY = ball_posY + (ball_speedY * ball_directionY);
 
 if (ball_posX > width-ball_size || ball_posX < 0) {
     ball_directionX *= -1; 
 }
 if (ball_posY > height-ball_size || ball_posY < 0) {
     ball_directionY *= -1;    
 }
    
 // Collision handling for Kirby
 pos2X = pos2X + (speed2X * direction2X);
  
 if (pos2X > 600 || pos2X < 120) {
   direction2X *= -1;
 }
   
 image(img1, posX, posY, size, size);
 
 image(img2, ball_posX, ball_posY, ball_size, ball_size);
 
 image(img3, pos2X, 400, size2, size2);
 
}
