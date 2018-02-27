//mover, particle system
//
// credit for Exercise_2_8 Daniel Shiffman The Nature of Code 
//
//http://natureofcode.com/book/chapter-2-forces/


class Star{
 
  float mass;
  PVector position;
  PVector acceleration;
  PVector velocity; 
  
  // constructor for star takes in mass value, x, y position value
  Star(float m, float x, float y){
    mass = m; 
    position = new PVector (x, y);
    velocity = new PVector (1, 0);
    acceleration = new PVector(0,0);    
  }
  //add forces
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
//change motion
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }
// draw ellipse for each star
  void displayStar(){
    stroke(255);
    fill(255);
    ellipse(position.x, position.y, mass, mass);
  }
}