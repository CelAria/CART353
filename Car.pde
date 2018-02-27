//mover class 
//image sourced from https://www.teslarentals.co.uk/
// credit for Exercise_2_8 Daniel Shiffman The Nature of Code 
//
//http://natureofcode.com/book/chapter-2-forces/

class Car {
 
  float mass;
  PVector position;
  PVector acceleration;
  PVector velocity; 
  String name;
  
   
  // constructor for star takes in mass value, x, y position value
  Car(float m, float x, float y){
    mass = m; 
    position = new PVector (x, y);
    velocity = new PVector (1, 0);
    acceleration = new PVector(0,0);  

  }
//add the vectors together
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f.x*1.5, f.y);
  }
//change the motion of movers
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }
//display the image 
  void displayCar(){
    stroke(255);
    fill(255);
    PImage img =loadImage("Tesla-Model-S-.png");
    image(img, position.x, position.y, 150, 100);
  }
}