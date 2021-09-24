PImage img1;
color bgColor = color(102, 178, 255);

/*  
collision handling code example used from the lecture and example
from https://processing.org/examples/bounce.html 
*/

int size = 80;

float posX, posY;

float speedX = 4;
float speedY = 4;

float directionX = 1;
float directionY = 1;


void setup() {
size(800, 600, P2D);
frameRate(60);


img1 = loadImage("Bmmain.gif");
posX = 150;
posY = 360;

}

void draw() {
 background (bgColor);
 fill(40, 1, 55);
 rect(150, 320, 500, 200);
 
 posX = posX + (speedX * directionX);
 posY = posY + (speedY * directionY);
 
 if (posX > width-size || posX < 0) {
     directionX *= -1; 
 }
 if (posY > height-size || posY < 0) {
     directionY *= -1;
 }
 
 image(img1, posX, posY, size, size);
  
}
