//mover class 
//image sourced from https://space-facts.com/transparent-planet-pictures/
// credit for Exercise_2_8 Daniel Shiffman The Nature of Code 
//
//http://natureofcode.com/book/chapter-2-forces/


class Planet{
 
  float mass;
  PVector position;
  PVector acceleration;
  PVector velocity; 
  int j;
  
  // constructor for star takes in mass value, x, y position value
  Planet(float m, float x, float y){
    mass = m; 
    position = new PVector (x, y);
    velocity = new PVector (1, 0);
    acceleration = new PVector(0,0);    
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }
// for each planet loop through array of 5 pictures
  void displayPlanet(Planet[] p){
    stroke(255);
    fill(255);
    for( int i = 1; i < p.length; i++)
    {   
  PImage img =loadImage("planet" + i +".png");
    image(img, position.x, position.y, 100, 100);
    }
  }
}