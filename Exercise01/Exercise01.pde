/* Sairus Pradhan (218946467)
LE EECS 1710 - Lab 1
09 / 15/ 2021
Exercise 1
*/

// Variables for background colour and shape size
color bgColor = color(102, 178, 255);
float recSize = 50;
float triangleSize = 120;

// background size and colour
void setup() {
  size(800, 600); 
  background(bgColor);
}

// sketch
void draw() {
  // triangle constantly drawn from fixed position to the position of mouse
  line(mouseX, mouseY, pmouseX, pmouseY);
  fill(244, 244, 244);
    triangle(mouseX, mouseY, triangleSize, triangleSize, 81, 81);
  
  // sun 
  fill(255, 255, 102);
  ellipse(800, 0, 180, 180);
  
  // draw rectangle if conditions are met
  if (mousePressed) {
    ellipseMode(CENTER);
    rectMode(CENTER);
    fill(224, 224, 224);
    stroke(0, 0, 0);
    line(mouseX, mouseY, pmouseX, pmouseY);
    rect(mouseX, mouseY, recSize, recSize);
  }
}
