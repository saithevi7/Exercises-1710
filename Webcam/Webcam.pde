/* 
Sairus Pradhan (218946467)
LE EECS 1710 - Lab 1
11 / 15/ 2021
Exercise 06

https://github.com/CodingTrain/website/blob/main/Tutorials/Processing/11_video/sketch_16_1_particles_capture/sketch_16_1_particles_capture.pde
From Daniel Shiffman and "The Coding Train" video: https://www.youtube.com/watch?v=WH31daSj4nc

I found this extremely cool pixel effect that can be implemented into the
camera and I mixed it with a flip effect.
*/

// variables 
import processing.video.*;
Particle[] particles;

Capture video;
int flip = 0;

/* setup "pipeline:autovideosrc" helped me with my camera problems.
 https://discourse.processing.org/t/processing-cant-find-the-camera-video-libraries-dont-work/25128/24
 from neilcsmith */
void setup() {
 size (800, 600);
 video = new Capture(this, 800, 600, "pipeline:autovideosrc");
 video.start();
 particles = new Particle [100];
 
// loop for paritcle effect 
 for(int i=0; i < particles.length; i++) {
   particles[i] = new Particle();
 } 
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
   // draw the loop from the particle class  
   for(int i=0; i < particles.length; i++) {
    particles[i].display();
    particles[i].move();
  }
  // video upside down and randomly change colour depending on mouse cords
  if(flip == 1) {
    tint(mouseX, mouseY, random(255)); // Warning: slight flashing lights.
    scale(-1, -1);
    image(video, -width, -height);
  }
}


void keyPressed() {
  if(key == ENTER) {
    flip = 1; // flip image
  }
  
  else if(key == BACKSPACE) {
    flip = 0; // reset to particles effect
  }
}
  
