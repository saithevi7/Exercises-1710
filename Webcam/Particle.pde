// https://github.com/CodingTrain/website/blob/main/Tutorials/Processing/11_video/sketch_16_1_particles_capture/Particle.pde
// From "The Coding Train" video: https://www.youtube.com/watch?v=WH31daSj4nc
class Particle {
  // variables 
  float x;
  float y;
  
  float vx;
  float vy;

  // constructor 
  Particle() {
    x = width/2;
    y = height/2;
    float a = random(TWO_PI);
    float speed = random(1,2);
    vx = cos(a)*speed;
    vy = sin(a)*speed;
  }

  // output
  void display() {
    noStroke();
    color c = video.get(int(x),int(y));
    fill(c,25);
    ellipse(x, y, 12, 12);
  }

  // pixel movement
  void move() {
    x = x + vx;//random(-5, 5);
    y = y + vy;//random(-5, 5);
    if (y < 0) {
      y = height;
    } 

    if (y > height) {
      y = 0;
    }
    if (x < 0) {
      x = width;
    } 

    if (x > width) {
      x = 0;
    }
  }
}
