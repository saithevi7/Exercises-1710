class LetterGenerator {
  
  // variables
  String input;
  PVector position;
  PImage img;
  color col;
  
  LetterGenerator(String _input, float x, float y) {
    input = _input;
    position = new PVector(x, y);
    col = getRandomColor();

    switch(input) {
      case "a":
        img = a;
        break;
      case "b":
        img = b;
        break;
      case "c":
        img = c;
        break;
      case "d":
        img = d;
        break;   
    }
  }
  
  color getRandomColor() {
    // random color for letters
    return color(127 + random(127), 127 + random(127), 127 + random(127)); 
  }
  
  void draw() {
    fill(col);
    stroke(0);
    strokeWeight(5);
    stroke(col);
    
    tint(0, 127); 
    image(img, position.x + 10, position.y + 10);
    
    
    stroke(0);
    strokeWeight(5);
    stroke(col);
    tint(col);
    image(img, position.x, position.y);
    noTint();
    
    
   
  }

}
