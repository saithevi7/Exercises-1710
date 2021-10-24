/* Sairus Pradhan (218946467)
LE EECS 1710 - Lab 1
10 / 18/ 2021
Exercise 3
*/

// https://processing.org/examples/clock.html

// variables
int clockX, clockY;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

color outlineCol = color(0);
color secondCol = color(200, 0, 0);
color faceCol = color(255,228,196);

// setup variables
void setup() {
  size(800, 600, P2D);
  stroke(255);
  
  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
  
  clockX = width / 2;
  clockY = height / 2;
}

void draw() {
  // Draw clock and background
  background(255, 255, 255);
  
  fill(80);
  noStroke();
  ellipse(clockX, clockY, clockDiameter, clockDiameter);
  
  // Inside of the clock
  fill(faceCol);
  stroke(outlineCol);
  ellipse(width/2, height/2, clockDiameter, clockDiameter);
  
  // Start at 3:00 and at the top. Grabs actual time. 
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  // Second, Minute and Hour hands and movement
  stroke(0, 0, 0);
  strokeWeight(1);
  line(clockX, clockY, clockX + cos(s) * secondsRadius, clockY + sin(s) * secondsRadius);
  strokeWeight(2);
  line(clockX, clockY, clockX + cos(m) * minutesRadius, clockY + sin(m) * minutesRadius);
  strokeWeight(4);
  line(clockX, clockY, clockX + cos(h) * hoursRadius, clockY + sin(h) * hoursRadius);
  
  // Minute clicks
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = clockX + cos(angle) * secondsRadius;
    float y = clockY + sin(angle) * secondsRadius;
    vertex(x, y);
  }
  endShape();
}
