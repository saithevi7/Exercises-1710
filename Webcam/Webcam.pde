/* Sairus Pradhan (218946467)
LE EECS 1710 - Lab 1
11 / 04/ 2021
Exercise 06

https://github.com/CodingTrain/website/blob/main/Tutorials/Processing/11_video/sketch_16_1_particles_capture/sketch_16_1_particles_capture.pde
From "The Coding Train" video: https://www.youtube.com/watch?v=WH31daSj4nc

I found this extremely cool pixel effect that can be implemented into the
camera and I mixed it with some other cool camera effects.
*/


import processing.video.*;
Particle[] particles;

Capture video;


void setup() {
 size (800, 600);
 video = new Capture(this, 800, 600, "pipeline:autovideosrc");
 video.start();
 particles = new Particle [100];
 
 
 for (int i=0; i < particles.length; i++) {
   particles[i] = new Particle();
 }
 background(0);
 
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  
   for (int i=0; i < particles.length; i++) {
    particles[i].display();
    particles[i].move();
  }
 
  loadPixels();
  video.loadPixels(); 
  
  // brightness adjustment
  for (int x = 0; x < video.width; x++) {
    for (int y = 0; y < video.height; y++) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y * video.width;

      /* Played around with the brightness and colour
         Instead of a plain flash light, we have different colors
         r,g,b values from selected image */
      
      float r = red  (video.pixels[loc]);
      float g = green(video.pixels[loc]);
      float b = blue (video.pixels[loc]);

      // brightness 
      float d = dist(x, y, mouseX, mouseY);  
      float adjustbrightness = map(d, 0, 100, 4, 0);
      r *= adjustbrightness;
     
      // Constrain green to a range 
      g = constrain(g, 0, 255);
    
      /// new color and set pixel
      color c = color(r, g, b);
      pixels[loc] = c;
    }
  }

  updatePixels();
  
}
