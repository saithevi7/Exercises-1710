/* Sairus Pradhan (218946467)
LE EECS 1710 - Lab 1
12/ 01/ 2021
Exercise 7

Simple itterative pattern for exercise 7.
 */
 
int gridSize = 23;
int gridSize2 = 40;
float y = random(0, 341);
float x = random(0, 341);
int num = 10;

void setup() {
  size(640, 360); 
  background(0);
}

// https://processing.org/examples/embeddediteration.html - Just changed the gridSize's number
void draw() {
  for (int x = gridSize; x <= width - gridSize; x += gridSize) {
    for (int y = gridSize; y <= height - gridSize; y += gridSize) {
      noStroke();
      fill(255);
      rect(x-1, y-1, 3, 3);
      stroke(255, 100);
      line(x, y, width/2, height/2);
    }
  }
  
  // made a second one
  for (int x = gridSize2; x <= width - gridSize2; x += gridSize2) {
    for (int y = gridSize2; y <= height - gridSize2; y += gridSize2) {
      noStroke();
      fill(255);
      rect(x-1, y-1, 3, 3);
      stroke(255, 100);
      line(x, y, width/2, height/2);
    }
  }

  // added simple itterations of grey bars 
  fill(51);
  y = 40;
  for(int i=0; i<num; i++) {
    rect(x, y, 30, 10);
    y += 20;
  }
  
  x = 53; 
  for(int i=0; i<num; i++) {
    rect(x, y, 64, 32);
    x += 12;
  }
}
