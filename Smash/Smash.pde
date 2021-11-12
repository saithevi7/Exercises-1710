/* Sairus Pradhan (218946467)
LE EECS 1710 - Lab 1
11 / 04/ 2021
Exercise 5
Used code from exercise 2 and added sound to it
*/

import processing.sound.*;

// Variables for image and class
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

// variables for sound
SoundFile collisionSound, kirbySound;
Sound s;

// setup 
void setup() {
size(800, 600, P2D);
frameRate(60);

// Inital position of Black mage
posX = 150;
posY = 360;

// Random position of Smash Ball
ball_posX = random(800);
ball_posY = random(600);

// Initial position of Kirby
pos2X = 300;

// define stage class
stage = new Stage();

// Find image
img1 = loadImage("Bmmain.gif");
img2 = loadImage("Smash_ball.png");
img3 = loadImage("kirby.png");
img4 = loadImage("galaxy.jpg");

// sounds
collisionSound = new SoundFile(this, "collision.wav"); //https://freesound.org/people/JustInvoke/sounds/446125/
collisionSound.cue(0);

kirbySound = new SoundFile(this, "cute.wav"); //https://freesound.org/people/ohhmye/sounds/561350/
kirbySound.cue(0);

// object that controls output volume
s = new Sound(this);
}

// Printing and sound process
void draw() {
 /*https://processing.org/reference/libraries/sound/Sound_volume_.html
  Control volume of the sound depending on Y value of the mouse
  The lower the y-value, the higher the volume and the higher the y-value, the lower the volume
 */ 
 float amplitude = map(mouseY, 0, height, 0.4, 0.0);
  
 // print image for background
 image(img4, 0, 0, width, height); 

 // draw from stage class
 stage.draw();

 // Movement, Collision, and Sound handling for Black Mage
 posX = posX + (speedX * directionX);
 posY = posY + (speedY * directionY);
 
 if (posX > width-size || posX < 0) {
     directionX *= -1; 
     collisionSound.rate(random(0.6, 0.8));
     collisionSound.jump(0);
 }
 if (posY > height-200 || posY < 0) {
     directionY *= -1;
     collisionSound.rate(random(0.6, 0.8));
     collisionSound.jump(0);
 }
 
 // Movement and Collision handling for the Smash Ball
 ball_posX = ball_posX + (ball_speedX * ball_directionX);
 ball_posY = ball_posY + (ball_speedY * ball_directionY);
 
 if (ball_posX > width-ball_size || ball_posX < 0) {
     ball_directionX *= -1; 
 }
 if (ball_posY > height-ball_size || ball_posY < 0) {
     ball_directionY *= -1;    
 }
    
 // Movement and Collision handling for Kirby
 pos2X = pos2X + (speed2X * direction2X);
  
 if (pos2X > 600 || pos2X < 120) {
   direction2X *= -1;
   kirbySound.rate(1);
   kirbySound.jump(0);
 }
 
 // Print images
 image(img1, posX, posY, size, size);
 
 image(img2, ball_posX, ball_posY, ball_size, ball_size);
 
 image(img3, pos2X, 400, size2, size2);
 
 //https://processing.org/reference/libraries/sound/Sound_volume_.html
 s.volume(amplitude);
 
}
