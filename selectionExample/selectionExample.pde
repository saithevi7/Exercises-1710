/* Sairus Pradhan (218946467)
LE EECS 1710 - Lab 1
10/ 25/ 2021
Exercise 4

I took the "draw and paste image" route where I drew and design my letters
and then worked with it here to output on command. The range goes from A-D.
*/

// variables
PImage a, b, c, d;
String input = "b";

PFont font;
int fontSize = 20;
String message = "Press letters from A-D to show shapes, click spacebar for more info";
String message2 = "Click BACKSPACE to clear EVERYTHING";

LetterGenerator lg1, lg2, lg3, lg4;

void setup() {
  size(800, 600, P2D);
 
  a = loadImage("a.png");
  b = loadImage("b.png");
  c = loadImage("c.png");
  d = loadImage("d.png");
  
  // random position BUT random every time you run the porgram, NOT erase
  lg1 = new LetterGenerator("a", random(width-200), random(height-200));
  lg2 = new LetterGenerator("b", random(width-200), random(height-200));
  lg3 = new LetterGenerator("c", random(width-200), random(height-200));
  lg4 = new LetterGenerator("d", random(width-200), random(height-200));
 
  font = createFont("Times New Roman", fontSize);
  textFont(font, fontSize);
  fill(0);
  
}

void draw() {
  text(message, 0, 14); // beginning texts
}

// input and output
void keyPressed() {
  if (key == 'a') {
    lg1.draw();
  }
  else if (key == 'b') {
    lg2.draw();
  }
  else if (key == 'c') {
    lg3.draw();
  }
  else if (key == 'd') {
    lg4.draw();
  }
  
  else if (key == ' ') {
    fill(0);
    text(message2, 0, 30 );
  }
  
  // erase everything but beginning text
  else if (key == BACKSPACE) {
    background(127);
  }
    
}
